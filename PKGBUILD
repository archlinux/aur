# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Lapis Apple <laple@pd2.ink>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.kugou.spark
pkgver=10.0.53spark3
pkgrel=1
epoch=
pkgdesc="Kugou Music Client from Spark Store"
arch=('i686' 'x86_64')
url="https://www.kugou.com/"
license=('unknown')
groups=()
depends=(
  'deepin-wine6-stable'
  'deepin-wine-helper'
  'xdg-utils'
)
checkdepends=()
optdepends=(
  'wqy-microhei: Recommended font'
  'wqy-zenhei: Recommended font'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
# install=kugou.install
changelog=
source=("https://d.store.deepinos.org.cn//store/music/${pkgname}/${pkgname}_${pkgver}_i386.deb")
sha512sums=('e64a17e03eb5f6961b0baeb2f7822247355914127945aa12f9c41ec00b84bb25d1e6744fe3d51842d45aff45174c7599d3a51f2b6ca42de35d28666c157b8bea')
validpgpkeys=()

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
  rm -rf opt/apps/com.kugou.spark/{entries,info}
}
