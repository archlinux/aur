pkgname=amdvbflash
pkgver=v4.71
pkgrel=1
pkgdesc="AMD vBIOS flash utility."
arch=('x86_64')
url="https://github.com/stylesuxx/amdvbflash"
license=('custom')
depends=()

source=("git+https://github.com/stylesuxx/amdvbflash.git")
md5sums=('SKIP')

#pkgver() {
#  cd amdvbflash
#  git describe --tags
#}

package() {
  cd amdvbflash
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 "amdvbflash" "$pkgdir/usr/bin"
}

