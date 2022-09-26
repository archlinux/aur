# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=1.3.208
pkgrel=1
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.intel.com/content/www/us/en/download/715595/"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/743764/SST_CLI_Linux_1.3.zip)
md5sums=('cb6a8ea8e08e54220fe271dc361fceb8')
sha1sums=('7d0b569778d272012512ac90f6efb8fc25043500')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/sst-"*".x86_64.rpm"
}
