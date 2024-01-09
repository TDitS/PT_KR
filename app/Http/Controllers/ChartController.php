<?php

namespace App\Http\Controllers;

use App\Models\OrderModel;
use App\Models\PriceModel;
use App\Models\WebScrapModel;
use Illuminate\Http\Request;

class ChartController extends Controller
{
    public function orderChart()
    {
        $orders = OrderModel::selectRaw('MONTH(purchase_date) as month, COUNT(*) as count')
            ->whereYear('purchase_date', '2023') // Выборка только за 2023 год
            ->groupBy('month')
            ->orderBy('month')
            ->get();

        $labels = [];
        $data = [];
        $colors = ['#ff5733', '#8c76d7', '#42e5ec', '#a0ed56', '#f28c1f', '#6b81ff', '#f0d33e', '#59b7a3', '#e057a8', '#71e46d', '#bf72f0', '#3cc3a7'];

        $monthNumbers = range(1, 12);

        foreach ($monthNumbers as $monthNumber) {
            $monthName = date('F', mktime(0, 0, 0, $monthNumber, 1));
            $orderCount = 0;

            foreach ($orders as $order) {
                if ((int)$order->month === $monthNumber) {
                    $orderCount = $order->count;
                    break;
                }
            }

            array_push($labels, $monthName);
            array_push($data, $orderCount);
        }

        $datasets = [
            [
                'label' => 'Количество покупок',
                'data' => $data,
                'backgroundColor' => $colors
            ]
        ];

        return view('charts', compact('datasets', 'labels'));
    }

    public function combinedChart()
    {
        $products = PriceModel::take(10)->get();
        $webScrapProducts = WebScrapModel::take(10)->get();

        $labels = $products->pluck('name');
        $prices = $products->pluck('price');

        $webScrapLabels = $webScrapProducts->pluck('Title');
        $webScrapPrices = $webScrapProducts->pluck('Price');

        $dataset = [
            'label' => 'Цены товаров из моего магазина',
            'data' => $prices,
            'backgroundColor' => '#8c76d7'
        ];

        $webScrapDataset = [
            'label' => 'Цены товаров из другого магазина',
            'data' => $webScrapPrices,
            'backgroundColor' => '#76d78c'
        ];

        return view('combined_chart', compact('dataset', 'labels', 'webScrapDataset', 'webScrapLabels'));
    }
}
