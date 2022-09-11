# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=solidigm-sst-storage-tool-cli
pkgver=1.2.198
pkgrel=1
pkgdesc="Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs"
arch=(x86_64)
url="https://www.intel.com/content/www/us/en/download/715595/"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/735799/SST_CLI_Linux_1.2.zip)
md5sums=('0c34a913970d5ab338b3ca50844dd61b')
sha1sums=('033bbc772be3e08cd4c35b9ba4ce362c05d20736')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/sst-"*".x86_64.rpm"
}
