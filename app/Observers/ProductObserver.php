<?php

namespace App\Observers;

use App\Models\PriceModel;

class ProductObserver
{
    public function productPurchased(PriceModel $product)
    {
        // Здесь происходит обработка события обновления модели
        // Например, уменьшение количества товара
        $product->decrement('count', 1);
    }
}
