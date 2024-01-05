# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='A modern watch command, binary version'
url="https://github.com/sachaos/viddy"
source=("${url}/releases/download/v$pkgver/${_pkgname}_Linux_x86_64.tar.gz")
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=('viddy')
provides=('viddy')
sha256sums=('c6bd8b9889faa8680ea97c7392efe31788a9700cc5a84a26f9ecd317c932b9ac')

package() {
  cd "$srcdir/"

  install -Dm755 viddy "${pkgdir}/usr/bin/viddy"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
