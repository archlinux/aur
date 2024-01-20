# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher-bin
pkgver=6.7.0.0
pkgrel=1
pkgdesc="Pixel phone flashing GUI utility with features."
arch=('x86_64')
url="https://github.com/badabing2005/PixelFlasher"
license=('GPL-3.0-or-later')
depends=('glibc' 'zlib')
optdepends=('android-tools: Use system platform tools'
            'scrcpy: Launch Screen Copy')
provides=('pixelflasher')
conflicts=('pixelflasher')
options=('!strip')
source=("PixelFlasher-$pkgver::$url/releases/download/v$pkgver/PixelFlasher_Ubuntu_22_04"
        'PixelFlasher.desktop'
        'PixelFlasher.png')
sha256sums=('f125454323b20e520fb810c9dab0d8ef8f15ce3845b763198641499ca22e2af1'
            '3f503e3e3b819562669e1d0a8a25043c478c8c1709b376642fd678caf3d8ee34'
            '7ac7e66ab29fd58c300196cc5f639baec6d8070b12613dcf09877a2fc5522c0d')

package() {
  install -Dm755 PixelFlasher-$pkgver "$pkgdir/usr/bin/PixelFlasher"
  install -Dm644 PixelFlasher.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 PixelFlasher.desktop -t "$pkgdir/usr/share/applications/"
}
