# Maintainer: Tomás Ralph <tomasralph2000@gmail.com>
_pkgname=ddi
pkgname=ddi-bin
pkgver=1.0
pkgrel=1
pkgdesc="A safer dd"
arch=(x86_64)
url="https://github.com/tralph3/ddi"
license=('GPL3')
depends=()
makedepends=()
archivename="${_pkgname}-v${pkgver}-${arch}-linux"
source=("https://github.com/tralph3/ddi/releases/download/v${pkgver}/${archivename}.tar.gz")
md5sums=('SKIP')

package() {

  local docdir="$pkgdir/usr/share/doc/${_pkgname}"
  local licdir="$pkgdir/usr/share/licenses/${_pkgname}"
  local bindir="$pkgdir/usr/bin"

  cd "${srcdir}"
  install -Dm0644 --target-directory "$docdir" "README.md"
  install -Dm0644 --target-directory "$licdir" "LICENSE"
  install -Dm0755 --target-directory "$bindir" "ddi"
}
