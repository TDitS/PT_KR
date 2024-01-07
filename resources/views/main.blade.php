@extends('pattern')

@section('title') Товары @endsection

@section('main')
    <div>
        <br><br>
        @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
        @if(isset($recommendedProduct))
            <h1>Рекомендуемый товар для вас:</h1>
            <div class="alert {{$recommendedProduct->count > 0 ? 'alert-success' : 'alert-secondary'}}">
                <h3>{{ $recommendedProduct->name }}</h3>
                <h5><b>{{ $recommendedProduct->price }} ₽</b></h5>
                @if($recommendedProduct->count > 0)
                    <h6><p>Осталось {{$recommendedProduct->count}} штук(-а)</p></h6>
                    <a href="{{ route('buyProduct', ['id' => $recommendedProduct->id]) }}" class="btn btn-success">Купить товар</a>
                @else
                    <p class="alert alert-warning ">Товар закончился</p>
                @endif
            </div>
        @endif
        <h1>Все товары:</h1>
        @foreach($prices as $el)
            <div class="alert {{$el->count > 0 ? 'alert-danger' : 'alert-secondary'}}">
                <h3>{{$el->name}}</h3>
                <h5><b>{{$el->price}} ₽</b></h5>
                @if($el->count > 0)
                    <h6><p>Осталось {{$el->count}} штук(-а)</p></h6>
                    <a href="{{ route('buyProduct', ['id' => $el->id]) }}" class="btn btn-success">Купить товар</a>
                @else
                    <p class="alert alert-warning ">Товар закончился</p>
                @endif
            </div>
        @endforeach
    </div>
@endsection
