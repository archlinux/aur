# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=intel-mas-cli-tool
pkgver=1.10
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(x86_64)
url="https://www.intel.com/content/www/us/en/download/19520/"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/646992/Intel_MAS_CLI_Tool_Linux_1.10.zip)
md5sums=('b7937e5ae5f538674df7b6eac56ae6d6')
sha1sums=('118d1249b3f359d2cc22fd1ee9454338ba09e616')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/usr/share/intelmas/Licenses" "$pkgdir/usr/share/licenses/${pkgname}/"
}
