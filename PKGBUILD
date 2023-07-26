# Maintainer: darkgeem <darkgeem at pyrokinesis.fr>
pkgname=hptnacp-bin
pkgver=1.03
pkgrel=1
pkgdesc="hacPackTools-NACP is a tool for creating and viewing Nintendo Switch NACP files"
arch=('x86_64')
url="https://github.com/The-4n/hacPack/tree/master/hacPack-Tools/hacPackTools-NACP"
licence=('GPL2')
depends=('pacman')
provides=('hptnacp')
conflicts=('hptnacp')
source_x86_64=("https://darkgeem.pyrokinesis.fr/arch/archives/hptnacp.tar.gz")
sha256sums_x86_64=("de211e1d0b3aeade4da16425f56ad0150f4bc82b7d0eed191b58d03d51f873c3")

package() {
	_bin_name="${pkgname/-bin/}"
	_bin_file="${srcdir}/${_bin_name}"
	install -Dm755 "${_bin_file}" "${pkgdir}/usr/bin/${_bin_name}"
}
