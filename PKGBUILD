# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=2.0
pkgrel=1
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://sdmsdfwdriver.blob.core.windows.net/files/kba-gcc/drivers-downloads/ka-00085/sst--2-0/sst-cli-linux-rpm--2-0.zip)
md5sums=('8c8c56552e0c493aac63a9bf6bf100ff')
sha1sums=('328e66a023f891809e5b8125072a1b74353d3a23')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/sst-"*".x86_64.rpm"
}
