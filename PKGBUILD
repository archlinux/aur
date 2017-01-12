# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Ng Oon-Ee <ngoonee@gmail.com>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=eclipse-linuxtools
pkgver=5.2.0
pkgrel=1
pkgdesc="Eclipse Linux Tools Project"
url="http://www.eclipse.org/linuxtools"
arch=('any')
license=('EPL')
depends=('eclipse')
optdepends=(
	'eclipse-ptp: remote profiling'
	'eclipse-rse: LTTng and remote profiling'
	'eclipse-gef: Draw2d and Zest'
	'eclipse-tcf: legacy LTTng'
	'eclipse-antlr-runtime: Tracing/LTTng'
)
source=("http://www.eclipse.org/downloads/download.php?r=1&mirror_id=274&file=/linuxtools/linuxtools-${pkgver}.zip")
md5sums=('48da995a125a44316632a97bdcf7946b')

package() {
  d="$pkgdir/usr/lib/eclipse/dropins/linuxtools/eclipse"
  install -d "$d"
  cp -a features "$d"
  cp -a plugins "$d"
}
