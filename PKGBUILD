# Maintainer: Nikita Revenco <archlinux.slider297@simplelogin.com>
pkgname='tinytime'
pkgver=r2.b7a5799
pkgrel=1
pkgdesc="A clock for the minimalist"
arch=('any')
url="https://github.com/nikitarevenco/tinytime"
license=('MIT')
makedepends=('git')
source=('tinytime::git+https://github.com/nikitarevenco/tinytime.git')
noextract=()
sha256sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/tinytime/tinytime.sh" "${pkgdir}/usr/bin/tinytime"
  chmod +x "${pkgdir}/usr/bin/tinytime"
}
