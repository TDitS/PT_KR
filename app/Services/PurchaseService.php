<?php
namespace App\Services;

use App\Models\PriceModel;

    class PurchaseService {
    public function __construct(private PriceModel $priceModel) {}

    public function buyProduct(int $productId) {
        $product = $this->priceModel->find($productId);
            if ($product && $product->count > 0) {
            return $product;
            } else {
            return null;
            }
        }
    }
