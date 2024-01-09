<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\HttpClient\HttpClient;
use App\Models\WebScrapModel;

class WebScrapController extends Controller
{
    public function webScrap(){

        $client = HttpClient::create();

        $response = $client->request('GET', 'https://signatures.ru/podarki/podarki-na-jubilej');
        $html = $response->getContent();

        $crawler = new Crawler($html);

        $products = $crawler->filter('.product-item-info');

        $products->each(function (Crawler $product) {
            $title = $product->filter('.product-item-link')->text();

            if(!WebScrapModel::where('Title', $title)->exists()) {
                $price = $product->filter('.product-ard-price')->text();
                $price = preg_replace('/\s+/', '', $price);
                $price = str_replace('₽', '', $price);
                $price = preg_replace('/[^0-9.]/', '', $price);
                $price = floatval(str_replace(',', '.', $price));

                WebScrapModel::create([
                    'Title' => $title,
                    'Price' => $price
                ]);

                echo "Title: $title, Price: $price\n";
            } else {
                echo "Товар с названием $title уже существует в базе данных.\n";
            }
        });
    }
}
