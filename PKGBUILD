# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=3.1
pkgrel=1
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://sdmsdfwdriver.blob.core.windows.net/files/kba-gcc/drivers-downloads/ka-00085/sst--3-1/sst-cli-linux-rpm--3-1.zip)
md5sums=('3e2786a20a9b034917b3172ac1d140e0')
sha1sums=('0e9d63f78e6c042d4dd33f1de801e4b60b767f1e')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}"/*"/sst-"*".x86_64.rpm"
}
