<?php
// SPDX-License-Identifier: Apache-2.0
/**
 * site-bootstrap.php — a stand-in for the getcadcraft.com site's core bootstrap, so the studio repo's packer
 * (pack/suite.mjs → pack/catalog.php, pack/render-suite.php) can pack a suite from public sources alone.
 */

declare(strict_types=1);

if (!defined('CC_PUBLIC')) define('CC_PUBLIC', dirname(__DIR__));
if (!defined('EDITION_SITE')) define('EDITION_SITE', 'https://getcadcraft.com');

if (!class_exists('Catalog')) {
    final class Catalog
    {
        /** Catalog order (the order the hub lays the apps out in). */
        private const ORDER = ['cadcraft', 'bimcraft', 'modelcraft', 'markupcraft', 'takeoffcraft', 'civilcraft', 'detailcraft', 'partcraft'];

        public static function apps(): array
        {
            $apps = [];
            $root = getenv('CADCRAFT_APPS') ?: '';
            foreach (self::ORDER as $slug) {
                $p = "$root/$slug/devshell/app.json";
                $j = file_exists($p) ? json_decode((string)file_get_contents($p), true) : null;
                if (isset($j['app']['slug'])) {
                    $apps[] = $j['app'];
                }
            }
            return $apps;
        }

        public static function upcoming(): array
        {
            return [];
        }

        public static function app(string $slug): ?array
        {
            foreach (self::apps() as $a) {
                if ($a['slug'] === $slug) return $a;
            }
            return null;
        }
    }
}

if (!class_exists('AppBuilds')) {
    final class AppBuilds
    {
        /** Where render-suite.php finds an app's source build: CADCRAFT_APPS/<slug>/<build>. */
        public static function root(string $slug): ?string
        {
            $root = getenv('CADCRAFT_APPS') ?: '';
            $path = "$root/$slug";
            return is_dir($path) ? $path : null;
        }
    }
}
