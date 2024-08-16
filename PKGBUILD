# Maintainer: Todd E Johnson <todd@toddejohnson.net>
pkgname=jfq
pkgver=1.2.11
pkgrel=1
pkgdesc="JSONata on the command line"
arch=('x86_64')
url="https://github.com/blgm/jfq"
license=('MIT')
depends=()
makedepends=('npm')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('0c2ddd4335b99db0664f185a030dd209c57d47d810b7f0642a39e0c290a9414d')
noextract=("${pkgname}-${pkgver}.tgz")

package(){
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
