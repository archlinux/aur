# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=1.5
pkgrel=1
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://sdmsdfwdriver.blob.core.windows.net/files/kba-gcc/drivers-downloads/ka-00085--sst/sst--1-5/sst-cli-linux-rpm--1-5.zip)
md5sums=('c48f49a5d9c81fc9604e3f87b26173c5')
sha1sums=('9999e630870733c4f05ec134b9c7b257da5ec49e')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/sst-"*".x86_64.rpm"
}
