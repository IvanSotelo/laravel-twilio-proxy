<?php

namespace IvanSotelo\LaravelTwilioProxy;

use Illuminate\Support\Facades\Facade;

/**
 * @see \Spatie\LaravelTwilioProxy\LaravelTwilioProxy
 */
class LaravelTwilioProxyFacade extends Facade
{
    protected static function getFacadeAccessor()
    {
        return 'laravel-twilio-proxy';
    }
}
