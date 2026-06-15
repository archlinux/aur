pkgname=cppfetch
pkgver=0.1.1
pkgrel=1
pkgdesc="A cmd fetch tool made in cpp"
arch=('x86_64')
url="https://github.com/oxodx/cppfetch"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('skip')

build() {
  cd "${pkgname}-${pkgver}"
  make build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
