# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher-bin
pkgver=5.8.0.0
pkgrel=1
pkgdesc="Pixel phone flashing GUI utility with features."
arch=('x86_64')
url="https://github.com/badabing2005/PixelFlasher"
license=('GPL3')
depends=('glibc' 'zlib')
optdepends=('android-tools' 'scrcpy')
provides=('pixelflasher')
conflicts=('pixelflasher')
options=('!strip')
source=("PixelFlasher-$pkgver::$url/releases/download/v$pkgver/PixelFlasher_Ubuntu_22_04"
        'PixelFlasher.desktop'
        'PixelFlasher.png')
sha256sums=('d8d113fbb9e487d0979d53e1aad994815ac30182b7af1f42944f38bacc43d937'
            '3f503e3e3b819562669e1d0a8a25043c478c8c1709b376642fd678caf3d8ee34'
            '7ac7e66ab29fd58c300196cc5f639baec6d8070b12613dcf09877a2fc5522c0d')

package() {
  install -Dm755 PixelFlasher-$pkgver "$pkgdir/usr/bin/PixelFlasher"
  install -Dm644 PixelFlasher.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 PixelFlasher.desktop -t "$pkgdir/usr/share/applications/"
}
