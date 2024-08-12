# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=1.14
pkgrel=1
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://sdmsdfwdriver.blob.core.windows.net/files/kba-gcc/drivers-downloads/ka-00085/sst--1-14/sst-cli-linux-rpm--1-14.zip)
md5sums=('56f7d64b25587f6aef44050c86ec5f53')
sha1sums=('d09ea066c5c7ddeccfe030e7ba59c38d04c615ca')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/sst-"*".x86_64.rpm"
}
