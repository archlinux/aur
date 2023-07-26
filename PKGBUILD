# Maintainer: darkgeem <darkgeem at pyrokinesis.fr>
pkgname=hacpack-bin
pkgver=1.36
pkgrel=1
pkgdesc="hacPack is a tool for creating Nintendo Switch NCAs (Nintendo Content Archive) and packing them into NSPs (Nintendo Submission Package)"
arch=('x86_64')
url="https://github.com/The-4n/hacPack/"
licence=('GPL2')
depends=('pacman')
provides=('hacpack')
conflicts=('hacpack')
source_x86_64=("https://darkgeem.pyrokinesis.fr/arch/archives/hacpack.tar.gz")
sha256sums_x86_64=("29f54663af7d3ffeb6715690cc0a498969c178a8b3f85fca8ce37027397d658a")

package() {
	_bin_name="${pkgname/-bin/}"
	_bin_file="${srcdir}/${_bin_name}"
	install -Dm755 "${_bin_file}" "${pkgdir}/usr/bin/${_bin_name}"
}
