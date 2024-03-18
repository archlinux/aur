pkgname=samin-pacman-hook-git
_pkgname='samin-pacman-hook'
pkgver=r0.3572d4d
pkgrel=1
pkgdesc='pacman hook for samin'
arch=('any')
url='https://gitlab.com/lepz0r/samin-pacman-hook'
license=('GPL2')
depends=('samin')
source=('git+https://gitlab.com/lepz0r/samin-pacman-hook.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p ${pkgdir}/usr/share/libalpm/{hooks,scripts}
  install -m 644 ./hooks/* ${pkgdir}/usr/share/libalpm/hooks/
  install -m 755 ./scripts/samin-pacman-hook  ${pkgdir}/usr/share/libalpm/scripts/
  }
