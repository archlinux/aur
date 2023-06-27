# Maintainer: spookyintheam <spookyintheam@protonmail.com> 

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.6.1
pkgrel=2
pkgdesc='Soothing pastel theme for GTK3 - Frappe'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Blue-dark.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Flamingo-dark.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Green-dark.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Lavender-dark.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Maroon-dark.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Mauve-dark.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Peach-dark.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Pink-dark.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Red-dark.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Rosewater-dark.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sapphire-dark.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sky-dark.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Teal-dark.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Yellow-dark.zip")

sha256sums=('b246b9142f8c3c9651449f58709156e410dd2c3bf0c5e0633a0aa9b70c8ae5e0'
            '193c0b0a282ed4f2faa975dad42fa5544bcc150cc8ba7636344af4412f2ce8d6'
            'f49f421cc825ade4e1290a2d400aaaf3974e828147415a064b877e20c5f1c56c'
            '30ae40179b936fa5abdc075a270d684db5a2137146257e22a613adc92f39bc68'
            'bc1f39d6b7ab521f54f00261ccb549b4b0c943935e111cc43b25f0e3342435d0'
            '546623777531b67c041accfd7a939a0412f47295b0628ee2859bec0a47eee8fc'
            '428b3e839afd37c99951051eb8c708262c877a48a3d585768e4ad8e0052efdf4'
            '5970af5bc30a756c10f41f8a7db83adc63fae15dc80d80dbd44aec25ab2deb39'
            '9e8a35c399ce5af953c336cbec98dfb19489157e9f853c14304eeb821f5770b5'
            '70501e2d797fbf68108cef9b53957b35b3bf2e89e30c0f6fd37d82fed9f9a311'
            '9ad8ac9efb23074bf09b91f62ceb1d2980f0a5055382e416898d88a3aab189ba'
            'f4111d030de01c77c81a7d1037123dcdb388c0065aa1329124c4f206867baddd'
            '8e8ffef4db2bf635f14b7a9054cc130bfe11d92f280358f480032e5df62e56e9'
            '9e34d2a6f95da5c7114a6b2118589730571c595633ba60db36c4c525ec74a7b8')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Frappe-Standard-Blue-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Blue-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Blue-dark" \
        "Catppuccin-Frappe-Standard-Flamingo-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-dark" \
        "Catppuccin-Frappe-Standard-Green-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Green-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Green-dark" \
        "Catppuccin-Frappe-Standard-Lavender-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Lavender-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Lavender-dark" \
        "Catppuccin-Frappe-Standard-Maroon-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Maroon-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Maroon-dark" \
        "Catppuccin-Frappe-Standard-Mauve-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Mauve-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Mauve-dark" \
        "Catppuccin-Frappe-Standard-Peach-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Peach-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Peach-dark" \
        "Catppuccin-Frappe-Standard-Pink-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Pink-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Pink-dark" \
        "Catppuccin-Frappe-Standard-Red-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Red-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Red-dark" \
        "Catppuccin-Frappe-Standard-Rosewater-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-dark" \
        "Catppuccin-Frappe-Standard-Sapphire-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-dark" \
        "Catppuccin-Frappe-Standard-Sky-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Sky-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Sky-dark" \
        "Catppuccin-Frappe-Standard-Teal-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Teal-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Teal-dark" \
        "Catppuccin-Frappe-Standard-Yellow-dark-hdpi" \
        "Catppuccin-Frappe-Standard-Yellow-dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Yellow-dark" \
                "$pkgdir/usr/share/themes"
}
