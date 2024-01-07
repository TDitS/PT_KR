<?php

namespace Tests\Unit;

use App\Models\PriceModel;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Observers\ProductObserver;
use Tests\TestCase;
use Mockery;

class ProjectTest extends TestCase
{

    //Применение временной базы данных для тестов
    use RefreshDatabase;

    //Тест отображения главной страницы с применением временной БД
    public function testMainPageDisplaysPrices() {
        // Создадим тестовые данные во временной базе данных
        \App\Models\PriceModel::factory()->create(['name' => 'Товар 1', 'price' => 100, 'count' => 5]);
        \App\Models\PriceModel::factory()->create(['name' => 'Товар 2', 'price' => 200, 'count' => 3]);

        $response = $this->get('/');
        $response->assertStatus(200);
        $response->assertSee('Товар 1');
        $response->assertSee('Товар 2');
        $response->assertSee('100');
        $response->assertSee('200');
        $response->assertSee('5');
        $response->assertSee('3');
    }

    //Тест отображения страницы покупки при наличии товара
    public function testBuyProductWithValidId() {
        $product = \App\Models\PriceModel::factory()->create(['count' => 3]);

        $response = $this->get('/buy/'.$product->id);
        $response->assertStatus(200);
        $response->assertSee('Отправить');
    }

    //Тест отсутствия возможности отображения страницы при покупке товара, который закончился
    public function testBuyProductWithInvalidId() {
        $product = \App\Models\PriceModel::factory()->create(['count' => 0]);

        $response = $this->get('/buy/'.$product->id);
        $response->assertStatus(302);
    }

    //Тест отображения несуществующего товара
    public function testBuyProductWithNonExistentIdWithMockery()
    {
        $invalidProductId = 9999999999;
        // Создание заглушки для метода find() модели PriceModel
        $priceModel = $this->mock(PriceModel::class);
        $priceModel->shouldReceive('find')->andReturn(null); // Возвращаем null при вызове метода find

        // Теперь выполним запрос с неверным идентификатором
        $response = $this->get('/buy/'.$invalidProductId);

        // Проверяем, что есть перенаправление на другую страницу (302)
        $response->assertStatus(302);
    }

    protected function tearDown(): void
    {
        parent::tearDown();
        Mockery::close();
    }

    //Тест открытия главной страницы
    public function testExample() {
        $response = $this->get('/');
        $response->assertOk();
    }

    //Тест открытия статистики
    public function testStat() {
        $response = $this->get('/stat');
        $response->assertOk();
    }

    //Тест на проверку формы покупки
    public function testBuyCheckFormSubmission() {
        $response = $this->post('/buy/check', [
            'product_id' => 1,
            'name' => 'Артём',
            'address' => 'Михайловка',
            'purchase_date' => 2024-01-03
        ]);
        $response = $this->get('/');
        $response->assertOk();
    }

    //Тест на валидацию некорректно введенных данных в форму покупки
    public function testValidateFiledBuyCheckFormSubmission() {
        $response = $this->post('/buy/check', [
            'product_id' => 1,
            'name' => '',
            'address' => '123 Main St',
            'purchase_date' => 2024-01-03
        ]);

        $response->assertSessionHasErrors(['name']);
    }

    //Тест на проверку формы регистрации
    public function testRegistrationCheckForm() {
        $response = $this->post('/register', [
            'name' => 'test',
            'email' => 'test@mail.ru',
            'password' => '11223344',
            'password_confirmation' => '11223344'
        ]);
        $response = $this->get('/home');
        $response->assertOk();
    }

    //Тест на валидацию некорректно введенных данных в форму регистрации
    public function testValidateFiledRegistrationCheckForm() {
        $response = $this->post('/register', [
            'name' => 'test',
            'email' => 'test@mail.ru',
            'password' => '11223344',
            'password_confirmation' => '112233'
        ]);

        $response->assertSessionHasErrors(['password']);
    }

    //Тест на проверку паттерна "Наблюдатель" с изменением количества товара
    public function testProductObserverDecreasesCountOnUpdate()
    {
        $product = PriceModel::factory()->create([
            'count' => 5,
        ]);

        // Создаем наблюдателя и вызываем метод productPurchased, который должен уменьшить количество товара
        $observer = new ProductObserver();
        $observer->productPurchased($product);

        // Проверяем, что количество товара было уменьшено на 1
        $this->assertEquals(4, $product->count);
    }

    //Тест на проверку создания данных с помощью фабрики
    public function testPriceModelCreation()
    {
        // Создание модели PriceModel с помощью фабрики
        $product = PriceModel::factory()->create([
            'name' => 'Test Product',
            'price' => 100,
            'count' => 10,
        ]);

        // Проверка атрибутов созданной модели
        $this->assertEquals('Test Product', $product->name);
        $this->assertEquals(100, $product->price);
        $this->assertEquals(10, $product->count);
    }

    //Тест на проверку использования фабрики по количеству
    public function testUsingPriceModelFactory()
    {
        // Использование фабрики для создания нескольких моделей PriceModel
        PriceModel::factory()->count(5)->create();

        // Проверка количества созданных моделей
        $this->assertEquals(5, PriceModel::count());
    }
}
