# Maintainer: Martin Hoppenheit <martin@hoppenheit.info>
pkgname=fanslow-probook430g2
pkgver=1.2.0
pkgrel=1
pkgdesc="better fan control for HP ProBook 430 G2"
arch=('any')
url="https://github.com/marhop/fanslow-probook430g2"
license=('GPL3')
depends=('perl')
source=("https://github.com/marhop/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2885607b677de769bee7ed7246b14cee')
sha256sums=('7c9d60c1e382e011c977354b1fe5c7674b78e7628f6176d04922d119129355f4')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
