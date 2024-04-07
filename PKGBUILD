# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.7.3
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

sha256sums=('17f78847eeb9d4134ed75e948772527b6bd65b767f6e20736dbf4eb9f72aef22'
            '902c51f2860d64e573388339f11305e580367516f7847a0b45e67f3e06d418d2'
            '0866b70efa696da657c63546549650ab7af48eef451c487d35eb421cb44daac9'
            '2856b47f45462b838c4a7b99144cb55e9183bb9bb58d23b893fe06992f04b913'
            '815542d9be82a2889abc6eeba923e34a4b3f499972e48b1849e57a0cf292eab2'
            'd37822f3db9f24de55fbc6bf92bbf874ec8018de79da29192e7201f8bd9d6e4c'
            '99f681600a039fb8bf6bdaf7edabf0805769c2c993206316f7d3e68d8dc6b0d6'
            '7eb1bd6fab20b47bd0890c5b1bbcab16e698f4e21011a58a58a026b1da6bdb3c'
            '5c01a9402c443ddbb434cc342574877b6a0e296d42705842b2718c16f909220d'
            'ed7bae13054b337b39c3f4a71d7659486b54b483245d98b6b63d78d5c633fba0'
            'e00a5a67981789f523607f19711a777daa5bea409f9770aca22ea6ee6d83ef6a'
            'eecba419c286693c1c1cea7376a08b07f6022414d8aee4a4ac3ae12e7bd71658'
            '8c5202b47ff96ec38cacd437427557250d31f1f560eae0fa1caf5ec73e8e1c7b'
            'f8500fdcf195b8bbd663f1a5fcf5d7cb6b576631958fd0d088ffe4ccf45d3617')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -r -a --no-preserve=ownership \
      Catppuccin-Latte-* "$pkgdir/usr/share/themes"
}
