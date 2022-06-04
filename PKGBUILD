# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=1.1.25
pkgrel=1
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.intel.com/content/www/us/en/download/715595/"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/728230/SST_CLI_Linux_1.1.zip)
md5sums=('e52deedcbc1cd60f1678f4aed2fdc7f0')
sha1sums=('910570cba524aed21e4d95aa9e85dd1075a4c2f2')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/sst-"*".x86_64.rpm"
}
