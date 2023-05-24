# Maintainer: spookyintheam <spookyintheam@protonmail.com> 

pkgname=catppuccin-gtk-theme-frappe
pkgver=0.6.0
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Frappe'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Blue-Dark.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Flamingo-Dark.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Green-Dark.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Lavender-Dark.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Maroon-Dark.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Mauve-Dark.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Peach-Dark.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Pink-Dark.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Red-Dark.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Rosewater-Dark.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sapphire-Dark.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Sky-Dark.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Teal-Dark.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Frappe-Standard-Yellow-Dark.zip")

sha256sums=('3707f72cc0fb7f8fd0d5136eb7d3d874fa6bc18cef7df18295b7fab49a2efa5b'
            'adb03ffeb962e9269a9b6e1d08b6f72f2fd75f7ab99badbb96741bb44d4ed98d'
            '5168dc70f06786081b9f97147527505fa27be1fd3df514a1605fd321ecbe96fc'
            'fd52277ba7beaf5d2a3498be7671d6526bb3460c395cd3ccfb5131d2ab7d2a35'
            '4b46b86eeb99c79bfb36430986ae1f44727f197464a4dcaa22aed64a9aad645d'
            '961185b71a31a8761a3bc4a14d7803599ebe4aa4ed3563325415dd4e6fcaaf59'
            'c9a2b1005f679cea1a6ee636d5585680ee0dc13f7044c8d6daae16f1fb13b3d5'
            '37dde06aa4101a23104b4908abe309d1708b28b4ebafbfbbed48ef48c534e4f3'
            '7c008d229fa841a2f8848a93ecc830ed87b177513571ec3f96ed4551e7b8d77b'
            '390bfd96b48f274bc03b93054d2b800e6c471eec035a28037a6c776ca0dc41e2'
            '0b719e842d5901bb1180c3f19641f415d8ba64b5a95011259476b5b232e3953f'
            'd4662db9064a3bb3d6d9961c07002334ccda3dbd19dc27d90be1a8be54ff35fa'
            '6d737ea3fce01ce521a269817a391f112726c325ac51e931961028e86098884d'
            'db66b62088aa622269e37c30b33d285a5f74fd977a93adc9bf5f1a88b5ae28b6')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -a --no-preserve=ownership \
        "Catppuccin-Frappe-Standard-Blue-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Blue-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Blue-Dark" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Flamingo-Dark" \
        "Catppuccin-Frappe-Standard-Green-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Green-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Green-Dark" \
        "Catppuccin-Frappe-Standard-Lavender-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Lavender-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Lavender-Dark" \
        "Catppuccin-Frappe-Standard-Maroon-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Maroon-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Maroon-Dark" \
        "Catppuccin-Frappe-Standard-Mauve-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Mauve-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Mauve-Dark" \
        "Catppuccin-Frappe-Standard-Peach-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Peach-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Peach-Dark" \
        "Catppuccin-Frappe-Standard-Pink-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Pink-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Pink-Dark" \
        "Catppuccin-Frappe-Standard-Red-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Red-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Red-Dark" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Rosewater-Dark" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Sapphire-Dark" \
        "Catppuccin-Frappe-Standard-Sky-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Sky-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Sky-Dark" \
        "Catppuccin-Frappe-Standard-Teal-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Teal-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Teal-Dark" \
        "Catppuccin-Frappe-Standard-Yellow-Dark-hdpi" \
        "Catppuccin-Frappe-Standard-Yellow-Dark-xhdpi" \
        "Catppuccin-Frappe-Standard-Yellow-Dark" \
                "$pkgdir/usr/share/themes"
}
