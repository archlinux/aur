# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=intel-mas-cli-tool
pkgver=1.0.5
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(any)
url="https://downloadcenter.intel.com/download/29337/Intel-Memory-and-Storage-Tool-CLI-Command-Line-Interface-?product=83425"
license=()
#depends=('' )
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/29337/eng/Intel%C2%AE_MAS_CLI_Tool_${pkgver}_Linux.zip)
sha1sums=('1e8eea966df0aa120b667c2e6727194110f9bc4d')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	rmdir --ignore-fail-on-non-empty "$pkgdir/etc"
}
