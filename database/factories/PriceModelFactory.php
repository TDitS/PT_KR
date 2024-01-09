<?php

namespace Database\Factories;
use App\Models\PriceModel;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\PriceModel>
 */
class PriceModelFactory extends Factory
{
    protected $model = PriceModel::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition() {
        return [
            'name' => $this->faker->word,
            'price' => $this->faker->randomFloat(2, 30000, 100000),
            'count' => $this->faker->numberBetween(0, 10)
        ];
    }
}
