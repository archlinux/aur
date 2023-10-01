# Maintainer: spookyintheam <spookyintheam@protonmail.com>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=0.7.0 
pkgrel=1
pkgdesc='Soothing pastel theme for GTK3 - Macchiato'
arch=('any')
license=('GPL3')
url='https://github.com/catppuccin/gtk'
source=("$pkgname-$pkgver-blue.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Blue-Dark.zip"
        "$pkgname-$pkgver-flamingo.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Flamingo-Dark.zip"
        "$pkgname-$pkgver-green.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Green-Dark.zip"
        "$pkgname-$pkgver-lavender.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Lavender-Dark.zip"
        "$pkgname-$pkgver-maroon.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Maroon-Dark.zip"
        "$pkgname-$pkgver-mauve.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Mauve-Dark.zip"
        "$pkgname-$pkgver-peach.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Peach-Dark.zip"
        "$pkgname-$pkgver-pink.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Pink-Dark.zip"
        "$pkgname-$pkgver-red.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Red-Dark.zip"
        "$pkgname-$pkgver-rosewater.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Rosewater-Dark.zip"
        "$pkgname-$pkgver-sapphire.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Sapphire-Dark.zip"
        "$pkgname-$pkgver-sky.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Sky-Dark.zip"
        "$pkgname-$pkgver-teal.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Teal-Dark.zip"
        "$pkgname-$pkgver-yellow.zip::$url/releases/download/v$pkgver/Catppuccin-Macchiato-Standard-Yellow-Dark.zip")

sha256sums=('5ab23399fce9613e0c81bf7595f73987da28e729ad79d489305d0b65935c1ed5'
            '2356ddccc50e147c31e204c63412a8af7b6c8ca373228490af87c302abac53c5'
            '450d183f87d1559d973d471b666096d0efd79c765e0b464742941d7a42984c47'
            '1cd932849b8fa750f522406e0ec3d4d9336cdab5277262808b18ca41dd633d28'
            '124885501ae39843be585cd7f22df07067f1e165620f0270004e2f25de9b9baa'
            '9fe4be4302380b4a1f7f625830804ea7bf969a0b61f63edd2b7dd4b84120fa9a'
            '5f9798b44fdf0b578f85fbf3ce4caff1d3a2b134f209307504d9b42d6df7eca6'
            '8fa7d328026e2f61a4858abc02ff48e5cb280b107ab957a52831f748b20e343c'
            '8315940bdab97494866bbaeefbdc8546620a32248c54ac9d3579a29c7c4eb0bd'
            '2749744c9a3d64f02ba500565706e7cb620e3ca00689897a5d733038a1321bdc'
            '8b961898345dd24e0f7b86e6bbfc50a2e39db9fba801782f6d297050fba12f72'
            '1b9a56298e6576a52818da49dcb31a37fcf952a22d98ed12d8bd8373a2297634'
            '648995c02cde15121639cfcd9047c8c91e6a0753fbf00113ac12fd851e01d16c'
            'e2cc1ff90b2c2db54ad78681f912f0d2c85f006ceb4a2e74a5f01f6877351f9d')
package() {
  install -d "$pkgdir/usr/share/themes/"
  cp -r -a --no-preserve=ownership \
    Catppuccin-Macchiato-* "$pkgdir/usr/share/themes"
}
