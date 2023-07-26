# Maintainer: darkgeem <darkgeem at pyrokinesis.fr>
pkgname=hacbrewpack-bin
pkgver=3.05
pkgrel=1
pkgdesc="hacBrewPack is a tool for creating Nintendo Switch NCAs (Nintendo Content Archive) from homebrews and pack them into NSPs (Nintendo Submission Package)"
arch=('x86_64')
url="https://github.com/The-4n/hacBrewPack/"
licence=('GPL2')
depends=('pacman')
provides=('hacbrewpack')
conflicts=('hacbrewpack')
source_x86_64=("https://darkgeem.pyrokinesis.fr/arch/archives/hacbrewpack.tar.gz")
sha256sums_x86_64=("077bdcfc1a55e5eaaa96bb64e3f2efb005300bc9d3a0bf3b5ffff75c4f5eb786")
package() {
	_bin_name="${pkgname/-bin/}"
	_bin_file="${srcdir}/${_bin_name}"
	install -Dm755 "${_bin_file}" "${pkgdir}/usr/bin/${_bin_name}"
}
