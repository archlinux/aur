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
sha256sums=('3eb9484e4b06cccd5dde578d8222c513392f591c1892305ec7e8a21d933d3626')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
