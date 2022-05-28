# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=intel-mas-cli-tool-v1.x
pkgver=1.12
pkgrel=1
pkgdesc="Legacy version supporting Intel NAND flash"
arch=(x86_64)
url="https://www.intel.com/content/www/us/en/download/19520/"
license=()
makedepends=('libarchive')
optdepends=()
conflicts=('intel-mas-cli-tool')
source=(https://downloadmirror.intel.com/690882/Intel_MAS_CLI_Tool_Linux_1.12.zip)
md5sums=('e21c87a20c5267d8bb2a90238d366085')
sha1sums=('866de1ceef9a7ed8af8809f98e5d79e2412c4eb7')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
}
