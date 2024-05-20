# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-gtk-theme-latte
pkgver=0.7.5 # renovate: datasource=github-tags depName=catppuccin/gtk
pkgrel=2
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

sha256sums=('46d33c8fa55124c379d4318bbd390b31f8ff537a8fe7083c05d689210086c635'
            '2ea27aa43a4d67b67563df930c0d2899cc1dd6a8e09baf3a58de2a35ba58815a'
            '7d9eeaa93970f0a9860184cd180b597196e90d8f3cde35c74f48a0e80ccfa154'
            'e7f44b35969acf31b33017188939bf7894dc589c7ca1665cec41c1b4ef604b63'
            'e182ca4cdbdf133237592994a253ce87f72a3c18d1bca6cacfcec37e4a01f676'
            'e49041a993ff5f4ae73c1b70e240883e203425707785596fbb1f272533978d43'
            '95d520b0d5e46da8b809e1c3119d2e2f391b74865afa64921237aff87991033c'
            '7ba3672f214f1457adbbfea5fa04b80bb28813adff61ee749a294e16d75ca231'
            'cd3b787920254c32d531ce15e5cc0d4cfdef44a8fc9d6b1ab233e02481f37c8f'
            '20cad88637ef700b5956b76f7b38e2826cc464c79e79757eb26ad1f93b106751'
            '6ee2d7223eee2e228e11c5ebc2cca099d1ef328cd459828a1e177f33acaa8a1a'
            'ab8acc47f3ed1bfaf23991648c73d86a16ba767f1a4cf0a3661ba0a19fb0204a'
            '919bb92571056409ef81da8994163107fac4b6a8b2010c5c9ff28b50e23d7bfe'
            'bc5623aae8ef17ce2a54f6b9c87565cdc66c0827292fe573c14e25a5e6d585f1')
package() {
    install -d "$pkgdir/usr/share/themes"
    cp -r -a --no-preserve=ownership \
      Catppuccin-Latte-* "$pkgdir/usr/share/themes"
}
