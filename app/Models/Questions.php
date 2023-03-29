<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Questions extends Model
{
    use HasFactory;

    /**
     * Get the options for the questions.
     */
    public function answers(): HasMany
    {
        //return $this->hasMany(Answers::class);
        return $this->hasMany(Answers::class, 'question_id', 'id');
    }
}
