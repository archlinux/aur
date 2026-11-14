# Maintainer: Ваше Имя <ваш@email>
pkgname=mp3-browser
pkgver=1.0.0
pkgrel=1
pkgdesc="A Browser of MP3. A Linux-GJS replica on an MP3-Explorer from early 2000-s."
arch=('any')
url="https://github.com/nestoris/mp3-browser"
license=('GPL')
depends=('gjs' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ff83aacbd6f2e89b34de2d7aa8300a0f94727cd1365aa59e9a1974872f75883d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
