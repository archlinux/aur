# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Ng Oon-Ee <ngoonee@gmail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-linuxtools
pkgver=3.2.0
pkgrel=2
pkgdesc="Eclipse Linux Tools Project"
url="http://www.eclipse.org/linuxtools"
arch=('any')
license=('EPL')
depends=('eclipse-cdt')
optdepends=(
	'eclipse-ptp: remote profiling'
	'eclipse-rse: LTTng and remote profiling'
	'eclipse-gef: Draw2d and Zest'
	'eclipse-tcf: legacy LTTng'
	'eclipse-antlr-runtime: Tracing/LTTng'
)
makedepends=('java-environment')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/linuxtools/linuxtools-${pkgver}.zip")
sha256sums=('332c1bba17e987066d831a76f035ccf68c5056a694c183c70fc62f8d5814407d')

package() {
  d="$pkgdir/usr/share/eclipse/dropins/linuxtools/eclipse"
  install -d "$d"
  cp -a features "$d"
  cp -a plugins "$d"
}
