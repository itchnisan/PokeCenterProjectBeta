<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    // Définir le nom de la table
    protected $table = 'users';

    // Définir la clé primaire personnalisée
    protected $primaryKey = 'id_user';

    // Désactiver l'incrémentation automatique si ce n'est pas une clé auto-incrémentée
    public $incrementing = true;

    // Définir le type de la clé primaire
    protected $keyType = 'int';

    /**
     * Les attributs pouvant être assignés en masse.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'username',
        'email',
        'password',
    ];

    /**
     * Les attributs à cacher pour la sérialisation.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Les attributs à caster.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'created_at' => 'datetime',
        'password' => 'hashed',
    ];
}
