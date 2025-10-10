# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=2.5
pkgrel=1
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://sdmsdfwdriver.blob.core.windows.net/files/kba-gcc/drivers-downloads/ka-00085/sst--2-5/sst-cli-linux-rpm--2-5.zip)
md5sums=('ebbf971c15621dfe622f14437671cdbc')
sha1sums=('fb3ef3ad8a2733edbcf828df1c79cde6fd7ae91d')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/sst-"*".x86_64.rpm"
}
