# Maintainer: lynix <lynix47@gmail.com>

pkgname=checkrun.sh
pkgver=1.0
pkgrel=2
pkgdesc="Cron-style mailing wrapper (not only) for systemd .timer units"
url="https://github.com/lynix/checkrun.sh"
arch=('any')
license=('MIT')
depends=('bash' 'coreutils')
optdepends=()
makedepends=()
conflicts=( 'checkrun.sh-git' )
replaces=()
backup=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lynix/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e0b6c27e6dabb89f9abfd2d0a493ca6c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
