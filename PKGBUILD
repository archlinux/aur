# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=3.0
pkgrel=2
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://sdmsdfwdriver.blob.core.windows.net/files/kba-gcc/drivers-downloads/ka-00085/sst--3-0/sst-cli-linux-rpm--3-0.zip)
md5sums=('e7533efa67701cec27dc196a42d258f2')
sha1sums=('a47cc51316e8234b471552281fdece74b6c36c7e')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}"/*"/sst-"*".x86_64.rpm"
}
