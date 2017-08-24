# Maintainer: Martin Hoppenheit <martin@hoppenheit.info>
pkgname=fanslow-probook430g2
pkgver=1.3.0
pkgrel=1
pkgdesc="better fan control for HP ProBook 430 G2"
arch=('any')
url="https://github.com/marhop/fanslow-probook430g2"
license=('GPL3')
depends=('perl')
source=("https://github.com/marhop/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('8b7317702e18ace10f1d41c74b6d294a')
sha256sums=('6eb241ba62fe46daa6b76ff7e0aafeafae877d8298c2a7037c27c782772e7a0a')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
