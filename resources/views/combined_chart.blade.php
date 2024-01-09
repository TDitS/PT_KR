<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Combined Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<h1 style="text-align: center; color: black;">Графики товаров</h1>

<div style="width: 900px; margin: auto;">
    <canvas id="productsChart"></canvas>
    <canvas id="webScrapChart"></canvas>
</div>

<script>
    var productsCtx = document.getElementById('productsChart').getContext('2d');
    var productsChart = new Chart(productsCtx, {
        type: 'bar',
        data: {
            labels: {!! json_encode($labels) !!},
            datasets: [{
                label: {!! json_encode($dataset['label']) !!},
                data: {!! json_encode($dataset['data']) !!},
                backgroundColor: {!! json_encode($dataset['backgroundColor']) !!}
            }]
        }
    });

    var webScrapCtx = document.getElementById('webScrapChart').getContext('2d');
    var webScrapChart = new Chart(webScrapCtx, {
        type: 'bar',
        data: {
            labels: {!! json_encode($webScrapLabels) !!},
            datasets: [{
                label: {!! json_encode($webScrapDataset['label']) !!},
                data: {!! json_encode($webScrapDataset['data']) !!},
                backgroundColor: {!! json_encode($webScrapDataset['backgroundColor']) !!}
            }]
        }
    });
</script>
</body>
</html>
