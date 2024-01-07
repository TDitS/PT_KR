<?php

namespace Database\Factories;

use App\Models\OrderModel;
use Illuminate\Database\Eloquent\Factories\Factory;
use Carbon\Carbon;
use Faker\Provider\DateTime;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\OrderModel>
 */
class OrderModelFactory extends Factory
{
    protected $model = OrderModel::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition() {
        return [
            'user_id' => $this->faker->numberBetween(1, 1),
            'product_id' => $this->faker->numberBetween(5, 15),
            'product_name' => $this->faker->word,
            'quantity' => $this->faker->numberBetween(1, 1),
            'price' => $this->faker->randomFloat(2, 1, 100),
            'count' => $this->faker->numberBetween(1, 10),
            'name' => $this->faker->word,
            'address' => $this->faker->word,
            'purchase_date' => $this->faker->dateTimeBetween('2023-01-01', '2023-12-31')->format('Y-m-d')
        ];
    }
}
