@extends('pattern')

@section('title') Покупка @endsection

@section('main')
    <br><br>
    <h1>Покупка:</h1>

    @if($errors -> any())
        <div class = "alert alert-danger">
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{$error}}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <form method="post" action="/buy/check">
        @csrf
        <input type="hidden" name="product_id" value="{{ $selectedProductId }}">
        <br><input type="text" name="name" id="name" class="form-control" placeholder="Введите своё имя">
        <br><input type="text" name="address" id="address" class="form-control" placeholder="Введите адрес доставки">
        <br><button type="submit" class="btn btn-success">Отправить</button>
    </form>
@endsection
