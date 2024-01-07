<?php

namespace App\Http\Controllers;

use App\Models\OrderModel;
use App\Models\PriceModel;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Observers\ProductObserver;
use Illuminate\Support\Facades\DB;
use App\Services\PurchaseService;

class MainController extends Controller {
    protected $purchaseService;

    public function __construct(PurchaseService $purchaseService) {
        $this->purchaseService = $purchaseService;
    }

    public function main() {
        $userId = Auth::id();
        $orders = DB::table('order_models')
            ->select('user_id', 'product_id', 'count', 'quantity', 'price')
            ->where('user_id', $userId)
            ->get()
            ->toArray();

        if (empty($orders)) {
            $prices = new PriceModel();
            return view('main', ['prices' => $prices->all()]);
        }
        $dataset = [];
        $forbiddenProducts = []; // Массив для хранения запрещенных товаров

        foreach ($orders as $order) {
            if ($order->count > 1 && !in_array($order->product_id, $forbiddenProducts)) {  // Добавляем фильтрацию наличия товара
                $dataset[] = [
                    'product_id' => (int)$order->product_id,
                    'price' => (int)$order->price,
                    'count' => (int)$order->count
                ];
            }else {
                $forbiddenProducts[] = $order->product_id; // Добавляем product_id в список запрещенных
            }
        }
        var_dump($forbiddenProducts);
        echo "<br><br>";

        var_dump($dataset);
        echo "<br><br>";

        $prices = array_column($dataset, 'price');
        if (count($prices) > 0) {
            $averagePrice = array_sum($prices) / count($prices);
        } else {
            $averagePrice = array_sum($prices) / 1;
        }

        $filteredDataset = array_filter($dataset, function($item) use ($averagePrice) {
            return $item['price'] < $averagePrice;
        });

        var_dump($filteredDataset);
        echo "<br><br>";

        $counts = array_column($filteredDataset, 'count');
        if (count($counts) > 0) {
            $averageCount = array_sum($counts) / count($counts);
        } else {
            $averageCount = array_sum($counts) / 1;
        }

        $filteredDataset2 = array_filter($dataset, function($item) use ($averageCount) {
            return $item['count'] > $averageCount;
        });

        // Фильтрация $filteredDataset2 на основе $forbiddenProducts
        $filteredDataset2 = array_filter($filteredDataset2, function($item) use ($forbiddenProducts) {
            return !in_array($item['product_id'], $forbiddenProducts);
        });
        var_dump($filteredDataset2);
        echo "<br><br>";

        $flatArray = array_map(function($item) {
            return $item['product_id'];
        }, $filteredDataset2);

        $valueCounts = array_count_values($flatArray);
        arsort($valueCounts);
        $mode = key($valueCounts);

        var_dump($mode);

        $prices = new PriceModel();
        $recommendedProduct = PriceModel::where('id', $mode)->first();
        return view('main', ['prices' => $prices->all(), 'recommendedProduct' => $recommendedProduct]);
    }

    public function buy(Request $request) {
        $id = $request->id;
        $product = $this->purchaseService->buyProduct($id);

        if ($product) {
            return view('buy', ['selectedProductId' => $id, 'selectedProductCount' => $product->count]);
        } else {
            return redirect('/')->with('error', 'Товар закончился или недоступен');
        }
    }

    public function buy_check(Request $request) {
        $valid = $request->validate([
            'name' => 'required|min:3|max:100',
            'address' => 'required|min:10|max:100'
        ]);

        $order = new OrderModel();
        $order->user_id = Auth::id();
        // Получение информации о товаре
        $product_id = $request->input('product_id');
        $order->name = $request->input('name');
        $order->address = $request->input('address');
        $order->quantity = 1;
        $order->purchase_date = Carbon::now()->format('Y-m-d');
        $product = PriceModel::find($product_id);
        if($product) {
            $order->product_id = $product->id; // Присваивание ID товара
            $order->product_name = $product->name; // Присваивание названия товара
            $order->price = $product->price;
            $order->count = $product->count;
            $order->save();

            $product = new PriceModel();
            $product = PriceModel::find($order->product_id);
            if ($product) {
                $order->save();
                $observer = new ProductObserver();
                $observer->productPurchased($product);
            }
        }

        return redirect('/')->with(['success' => 'Спасибо за покупку: ' . $request->input('name')]);
    }
}
