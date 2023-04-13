# Maintainer: spookyintheam <spookyintheam@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=catppuccin-gtk-theme-macchiato
pkgver=0.5.0
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

sha256sums=('8f12461ca5bccbce7e97acbaace00ad8addfd069eca10db56e7a6a7317737a15'
            '049a45984d7f55c408d9c0eb7ea2de4ece04457fbbfdc8265fad314e8001e5db'
            '80047c325470b1fa51c518ef78cf3c8789f20c8236ec874bf6c7c69f6894872b'
            '4d0fec41812221bbd7273c44c785c2c604b4b067f7db26af0f83bd4042c6065a'
            'cbe2731f24c19cd268c69d0fb43b7172a18c2ca24d8c8cb52d249b74a5a8c09c'
            '306867de0fa1cc7db0b44ff816fb349d5d0db4fbbcc6c6e2ea57ad44ae913c34'
            '1371d2f33adf976ed36d8236eb85ac961a45ce3b97fcd4d653ca2cff95eee555'
            '60d6a4503323f7e1d51ca8a44b137c93e29113fef00a0a797477b8a7ce89fde5'
            '8a3f706da86f1b1217404522916e9a0fe5db0854dfc4cb61a6d3fa18235109b6'
            '14e65c4bf45ba8c8dd1373764d2e29a4db2c87f0a4565b429491101e668ec6e0'
            '3191d4b3d28d09221806df4077a04f02c55e8c2cc67c5eee72864391928627c3'
            '671cb58b9dcbce240360e6883eac91842d87977ea78e0377a0b9e096a05660d0'
            '72c228b0bac546442598b680d7868ad89498ca3ecde1bc41cb9898b644d2b9cc'
            '56132685308c0343aac25b177301e5fbd58342e4c40366396008486c2ca3e84d')
package() {
  install -d "$pkgdir/usr/share/themes/"
  cp -a --no-preserve=ownership \
      "Catppuccin-Macchiato-Standard-Blue-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Blue-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Blue-Dark" \
        "Catppuccin-Macchiato-Standard-Flamingo-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Flamingo-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Flamingo-Dark" \
        "Catppuccin-Macchiato-Standard-Green-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Green-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Green-Dark" \
        "Catppuccin-Macchiato-Standard-Lavender-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Lavender-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Lavender-Dark" \
        "Catppuccin-Macchiato-Standard-Maroon-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Maroon-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Maroon-Dark" \
        "Catppuccin-Macchiato-Standard-Mauve-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Mauve-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Mauve-Dark" \
        "Catppuccin-Macchiato-Standard-Peach-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Peach-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Peach-Dark" \
        "Catppuccin-Macchiato-Standard-Pink-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Pink-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Pink-Dark" \
        "Catppuccin-Macchiato-Standard-Red-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Red-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Red-Dark" \
        "Catppuccin-Macchiato-Standard-Rosewater-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Rosewater-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Rosewater-Dark" \
        "Catppuccin-Macchiato-Standard-Sapphire-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Sapphire-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Sapphire-Dark" \
        "Catppuccin-Macchiato-Standard-Sky-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Sky-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Sky-Dark" \
        "Catppuccin-Macchiato-Standard-Teal-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Teal-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Teal-Dark" \
        "Catppuccin-Macchiato-Standard-Yellow-Dark-hdpi" \
        "Catppuccin-Macchiato-Standard-Yellow-Dark-xhdpi" \
        "Catppuccin-Macchiato-Standard-Yellow-Dark" \
      "$pkgdir/usr/share/themes"
}
