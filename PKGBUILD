# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_intelid=29628
pkgname=intel-mas-cli-tool
pkgver=1.0.6
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(any)
url="https://downloadcenter.intel.com/download/${_intelid}"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/${_intelid}/eng/Intel%C2%AE_MAS_CLI_Tool_${pkgver}%20Linux.zip)
md5sums=('553b27387a1f4a2350c60c63bae2d1f5')
sha1sums=('36587603fcdc1d5eb15c70bea7427e0099e9bab3')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	rmdir --ignore-fail-on-non-empty "$pkgdir/etc"
}
