<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateUsersTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Ajoute une colonne remember_token si elle n'existe pas
            if (!Schema::hasColumn('users', 'remember_token')) {
                $table->string('remember_token', 100)->nullable();
            }

            // Ajoute une colonne email_verified_at pour la vérification des emails (optionnel)
            if (!Schema::hasColumn('users', 'email_verified_at')) {
                $table->timestamp('email_verified_at')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['remember_token', 'email_verified_at']);
        });
    }
};
