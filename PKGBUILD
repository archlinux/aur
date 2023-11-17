# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.7.1
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Latte'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Blue-Light.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Flamingo-Light.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Green-Light.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Lavender-Light.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Maroon-Light.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Mauve-Light.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Peach-Light.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Pink-Light.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Red-Light.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Rosewater-Light.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sapphire-Light.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Sky-Light.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Teal-Light.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Latte-Standard-Yellow-Light.zip")

sha256sums=('394dc0cb3709b74718056e63ebc4f7ccfb952d33eca4287a383d7186a5f1c22a'
            '3e22b8adc7e42cf2ff012d082dc564165a2a2617c6cf53be147c3a2dc7624458'
            '9ed6327c700385846febb3fcbe1f6f10e85f3b71388d1821e80405d6054af2ed'
            '3034daf27f1c7f2fe884dada9706b7af1470f4dc04bee3bd30a1e40ee5983640'
            '4b506f243c113a81562ee7fd09ceb70e1fb20f9a16a882f199de21d161b1ad69'
            'c3c054e4f8efbd259242ddb4ccf96c239f13aace4f1779ed894aff42f5fdd3e7'
            '9ec4bb8773c355faf4be01847f394f5265147eb08cddd27486a84879510eb6e5'
            'a7ee1b565e2a65c93a8350c5f2197e74b404d4c0c3fbcf686456cadc3fa1539a'
            '8bdee8872f89d8e90894e3559febfdcde0e94d758bc0c5552152e7ef75389f9e'
            'f1114a1e9c895b8b9e39c4a462ce523ccd25cc7b927e7e0bb62ae6b45926fb2a'
            '8d1968fe193f9fb6c2c7e3ab8fdcfdfae41eeec525e55268d28f2f3fdb036468'
            '3857e7fd76ff43672a0a5e7fa070e4f29159ad3df45c86ff8241c26ff25a7a0c'
            '07a7102ec9cf4fc462907a1d0c081d5a9944b8cd2f372a38951feca4142ef0c0'
            '0fe301e5a1b6caa42f444d86879898de536edd24ad37d3ac20e72c1744b4fa29')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -r -a --no-preserve=ownership \
      Catppuccin-Latte-* "$pkgdir/usr/share/themes"
}
