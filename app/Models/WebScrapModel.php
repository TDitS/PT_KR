<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WebScrapModel extends Model
{
    protected $fillable = ['Title', 'Price'];
    use HasFactory;
    public $timestamps = false;
}
