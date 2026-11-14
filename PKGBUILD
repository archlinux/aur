# Maintainer: Ваше Имя <ваш@email>
pkgname=mp3-browser
pkgver=1.0.0
pkgrel=1
pkgdesc="GJS-браузер MP3 с поддержкой ID3-тегов"
arch=('any')
url="https://github.com/nestoris/mp3-browser"
license=('GPL')
depends=('gjs' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('17ce10624b725085edfcc30026bf756d5c17447b2c8e45355e28140118fb3d07')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
