<?php

namespace IvanSotelo\LaravelTwilioProxy\Commands;

use Illuminate\Console\Command;

class LaravelTwilioProxyCommand extends Command
{
    public $signature = 'laravel-twilio-proxy';

    public $description = 'My command';

    public function handle()
    {
        $this->comment('All done');
    }
}
