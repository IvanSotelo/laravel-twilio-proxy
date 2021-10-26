# :package_description

[![Latest Version on Packagist](https://img.shields.io/packagist/v/ivansotelo/laravel-twilio-proxy.svg?style=flat-square)](https://packagist.org/packages/ivansotelo/laravel-twilio-proxy)
[![GitHub Tests Action Status](https://img.shields.io/github/workflow/status/ivansotelo/laravel-twilio-proxy/run-tests?label=tests)](https://github.com/ivansotelo/laravel-twilio-proxy/actions?query=workflow%3ATests+branch%3Amaster)
[![GitHub Code Style Action Status](https://img.shields.io/github/workflow/status/ivansotelo/laravel-twilio-proxy/Check%20&%20fix%20styling?label=code%20style)](https://github.com/ivansotelo/laravel-twilio-proxy/actions?query=workflow%3A"Check+%26+fix+styling"+branch%3Amaster)
[![Total Downloads](https://img.shields.io/packagist/dt/ivansotelo/laravel-twilio-proxy.svg?style=flat-square)](https://packagist.org/packages/ivansotelo/laravel-twilio-proxy)

Twilio Proxy simplifies the task of masking the communications between two parties (aka masked phone numbers or masked calling). Proxy automatically provides a number and associates two numbers together in order to forward messages and calls back and forth.

## Support us

[<img src="https://github-ads.s3.eu-central-1.amazonaws.com/package-skeleton-laravel.jpg?t=1" width="419px" />](https://IvanSotelo.be/github-ad-click/package-skeleton-laravel)

We invest a lot of resources into creating [best in class open source packages](https://IvanSotelo.be/open-source). You can support us by [buying one of our paid products](https://IvanSotelo.be/open-source/support-us).

We highly appreciate you sending us a postcard from your hometown, mentioning which of our package(s) you are using. You'll find our address on [our contact page](https://IvanSotelo.be/about-us). We publish all received postcards on [our virtual postcard wall](https://IvanSotelo.be/open-source/postcards).

## Installation

You can install the package via composer:

```bash
composer require ivansotelo/laravel-twilio-proxy
```

You can publish and run the migrations with:

```bash
php artisan vendor:publish --provider="IvanSotelo\LaravelTwilioProxy\LaravelTwilioProxyServiceProvider" --tag="laravel-twilio-proxy-migrations"
php artisan migrate
```

You can publish the config file with:
```bash
php artisan vendor:publish --provider="IvanSotelo\LaravelTwilioProxy\LaravelTwilioProxyServiceProvider" --tag="laravel-twilio-proxy-config"
```

This is the contents of the published config file:

```php
return [
];
```

## Usage

```php
$laravel-twilio-proxy = new IvanSotelo\LaravelTwilioProxy();
echo $laravel-twilio-proxy->echoPhrase('Hello, Ivan Sotelo!');
```

## Testing

```bash
composer test
```

## Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information on what has changed recently.

## Contributing

Please see [CONTRIBUTING](.github/CONTRIBUTING.md) for details.

## Security Vulnerabilities

Please review [our security policy](../../security/policy) on how to report security vulnerabilities.

## Credits

- [Ivan Sotelo](https://github.com/IvanSotelo)
- [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
