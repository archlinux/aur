# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-prevent-xscreensaver
pkgver=1.16
pkgrel=2
pkgdesc="Keep xscreensaver from coming while Kodi is running."
arch=(any)
url="https://github.com/graysky2/kodi-prevent-xscreensaver"
depends=('xscreensaver')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/kodi-prevent-xscreensaver/archive/v1.16.tar.gz")
install=readme.install
sha256sums=('d7885ebe4f07054cd4672a3b68792ea08d322dbd048964c8c4562370bcc0259c')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
