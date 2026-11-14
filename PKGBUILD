# Maintainer: Nestoris <voltasar@gmail.com>
pkgname=mp3-browser
pkgver=0.1.0  # Эта строка будет обновляться автоматически
pkgrel=1
pkgdesc="GJS-браузер MP3 с поддержкой ID3-тегов"
arch=('any')
url="https://github.com/nestoris/mp3-browser"
license=('GPL')
depends=('gjs' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP') # При необходимости замените на реальную сумму

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}