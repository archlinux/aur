# Maintainer: Ваше Имя <ваш@email>
pkgname=mp3-browser
pkgver=1.0.1
pkgrel=1
pkgdesc="A Browser of MP3. A Linux-GJS replica on an MP3-Explorer from early 2000-s."
arch=('any')
url="https://github.com/nestoris/mp3-browser"
license=('GPL')
depends=('gjs' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('434f274a5d9f039e75c69cef14edfc6583ed58f5c7a386c1e76ee4da371f0d82')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
