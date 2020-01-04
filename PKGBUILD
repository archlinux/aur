# Maintainer: Nishant <nin3ty1@gmail.com>
pkgname=fanslow-probook440g3
pkgver=0.1.440
pkgrel=1
pkgdesc="Better fan control for HP ProBook 440 G3 based on https://github.com/marhop/fanslow-probook430g2"
arch=('any')
url="https://github.com/compliment/fanslow-probook440g3"
license=('GPL3')
depends=('perl')
source=("https://github.com/compliment/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
