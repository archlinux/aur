# Maintainer: tinywrkb <tinywrkb@gmail.com>

pkgname=gettext-hostname
pkgver=2021.02.24.1
pkgrel=1
pkgdesc="use gettext's hostname and avoid inetutils"
url='https://aur.archlinux.org/packages/gettext-hostname/'
license=('GPL')
arch=('any')
depends=('gettext')
conflicts=('inetutils')
provides=('inetutils')

package() {
  install -dm755 ${pkgdir}/usr/bin/
  ln -s ../lib/gettext/hostname ${pkgdir}/usr/bin/hostname
}
