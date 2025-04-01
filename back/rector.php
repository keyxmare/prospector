<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;

return RectorConfig::configure()
        ->withPaths([__DIR__ . '/src', __DIR__ . '/tests'])
        ->withPreparedSets(
            deadCode: true,
            codeQuality: true,
            codingStyle: true,
            typeDeclarations: true,
            privatization: true,
            naming: true,
            instanceOf: true,
            earlyReturn: true,
            strictBooleans: true,
            carbon: true,
            rectorPreset: true,
            phpunitCodeQuality: true,
            doctrineCodeQuality: true,
            symfonyCodeQuality: true,
            symfonyConfigs: true
        )
        ->withAttributesSets(symfony: true, doctrine: true);