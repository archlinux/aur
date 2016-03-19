# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Ng Oon-Ee <ngoonee@gmail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-linuxtools
pkgver=4.2.2
pkgrel=1
pkgdesc="Eclipse Linux Tools Project"
url="http://www.eclipse.org/linuxtools"
arch=('any')
license=('EPL')
depends=('eclipse-cpp')
optdepends=(
	'eclipse-ptp: remote profiling'
	'eclipse-rse: LTTng and remote profiling'
	'eclipse-gef: Draw2d and Zest'
	'eclipse-tcf: legacy LTTng'
	'eclipse-antlr-runtime: Tracing/LTTng'
)
makedepends=('java-environment')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/linuxtools/linuxtools-${pkgver}.zip")
sha256sums=('5ae38475a68d1ee5b6a9c5b56c6ab505682250cee1686262e682d240b59b231e')

package() {
  d="$pkgdir/usr/lib/eclipse/dropins/linuxtools/eclipse"
  install -d "$d"
  cp -a features "$d"
  cp -a plugins "$d"
}
