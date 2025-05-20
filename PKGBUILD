# Maintainer: Alexander Bauer <sasha at linux dot com>

pkgname=mimirtool-bin
pkgdesc="Command-line tool that operators and tenants can use to execute a number of common tasks that involve grafana mimir or grafana cloud metrics."
pkgver=2.16.0
pkgrel=1
arch=('x86_64')
url="https://grafana.com/docs/mimir/latest/manage/tools/mimirtool/"
license=('AGPL-3.0-only')
_srcname=mimirtool
_binary=mimirtool-linux-amd64
source=(
  "https://github.com/grafana/mimir/releases/download/mimir-${pkgver}/$_binary"
)
sha256sums=('65aa3f195371aed0d0b69d7ce71ad3f24fcbfb440f3a4f0d5077c8951e95d43e')

package() {
  install -Dm 755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${_srcname}"
}
