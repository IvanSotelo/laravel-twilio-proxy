<?php

namespace IvanSotelo\LaravelTwilioProxy;

use Spatie\LaravelPackageTools\Package;
use Spatie\LaravelPackageTools\PackageServiceProvider;
use IvanSotelo\LaravelTwilioProxy\Commands\LaravelTwilioProxyCommand;

class LaravelTwilioProxyServiceProvider extends PackageServiceProvider
{
    public function configurePackage(Package $package): void
    {
        /*
         * This class is a Package Service Provider
         *
         * More info: https://github.com/spatie/laravel-package-tools
         */
        $package
            ->name('laravel-twilio-proxy')
            ->hasConfigFile()
            ->hasViews()
            ->hasMigration('create_laravel-twilio-proxy_table')
            ->hasCommand(LaravelTwilioProxyCommand::class);
    }
}
