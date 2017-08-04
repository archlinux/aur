# Maintainer: Martin Hoppenheit <martin@hoppenheit.info>
pkgname=fanslow-probook430g2
pkgver=1.2.1
pkgrel=1
pkgdesc="better fan control for HP ProBook 430 G2"
arch=('any')
url="https://github.com/marhop/fanslow-probook430g2"
license=('GPL3')
depends=('perl')
source=("https://github.com/marhop/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('6bc427d9b3a2784af0e2f7b0cb7b96bf')
sha256sums=('8b4cca7a186b8fca2cec0c95931c746fb91e342aad7d87623748fb5c61fd91f5')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
