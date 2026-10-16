<?php
// SPDX-License-Identifier: Apache-2.0
/**
 * site-edition.php — a stand-in for the library helpers the studio repo's pack/render-suite.php takes from the site's
 * devshell/edition.php, for packing a suite from public sources alone.
 */

declare(strict_types=1);

function _edition_release(string $src): string
{
    foreach (glob(dirname($src) . '/web/*/release.json') ?: [] as $f) {
        return $f;
    }
    return '';
}

/** The app's own libraries (edition libs minus shared shell libs). */
function edition_libs(string $src, string $pub): array
{
    $rel = _edition_release($src);
    $libs = $rel ? (json_decode((string)file_get_contents($rel), true)['libs'] ?? []) : [];
    return array_diff_key($libs, edition_shell_libs($pub));
}

/** Shared shell libraries (bootstrap, bootstrap-icons, archivo). */
function edition_shell_libs(string $pub): array
{
    static $libs = null;
    if ($libs !== null) {
        return $libs;
    }
    $libs = [];
    $ed = getenv('CADCRAFT_EDITIONS') ?: '';
    foreach (glob("$ed/*/browser-edition/*/release.json") ?: [] as $f) {
        $all = json_decode((string)file_get_contents($f), true)['libs'] ?? [];
        $keys = array_intersect_key($all, array_flip(['bootstrap', 'bootstrap-icons', 'archivo']));
        if ($keys) {
            foreach ($keys as $lib => $v) {
                $libs[$lib] = ['version' => $v];
            }
            break;
        }
    }
    return $libs;
}
