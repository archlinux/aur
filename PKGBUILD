# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname=rsyslog-openrc
pkgver=0.1
pkgrel=1
pkgdesc="OpenRC init script for rsyslog"
arch=('any')
url="https://pkgs.alpinelinux.org/package/edge/main/x86_64/rsyslog-openrc"
license=('Apache-2.0 AND GPL-3.0-or-later AND LGPL-3.0-or-later')
depends=('openrc' 'rsyslog')
source=('rsyslog')
b2sums=('3612d4ac188d5e28d03851882c3c1621dea4ee894eb51572703ab214e0841049a7dccfa180a7ed4ebb3faa3d3b5edaec61ea9426e146ca790ab8fb314fd6b224')

package() {
  install -Dm755 "${srcdir}/rsyslog" "${pkgdir}/etc/init.d/rsyslog"
}
