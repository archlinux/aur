# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname=scx-openrc
pkgver=0.1
pkgrel=1
pkgdesc="OpenRC init script for scx-scheds"
arch=('any')
url="https://aur.archlinux.org/pkgbase/scx-openrc"
license=('GPL2')
depends=('openrc' 'scx-tools')
source=(
  'scx'
  'scx-conf.d'
)
backup=('etc/conf.d/scx')
sha256sums=('8374e55e7a0eb57ec046a9042d879b9d071532b05c8bff1253f60e18674a2fba'
            '71887a9a941785d141b4db0afbea1311ab04b254ba7dfdbbe170f43e4aca3043')

package() {
  install -Dm755 "${srcdir}/scx" "${pkgdir}/etc/init.d/scx"
  install -Dm644 "${srcdir}/scx-conf.d" "${pkgdir}/etc/conf.d/scx"
}
