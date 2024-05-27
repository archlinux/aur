# Maintainer: Nikita Revenco <me@nikitarevenco.com>
pkgname='tinyfetch'
pkgver=r2.b7a5799
pkgrel=1
pkgdesc="A fetch for the minimalists"
arch=('any')
url="https://github.com/nikitarevenco/tinyfetch"
license=('MIT')
makedepends=('git')
source=('tinyfetch::git+https://github.com/nikitarevenco/tinyfetch.git')
noextract=()
sha256sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/tinyfetch/tinyfetch.sh" "${pkgdir}/usr/bin/tinyfetch"
  chmod +x "${pkgdir}/usr/bin/tinyfetch"
}
