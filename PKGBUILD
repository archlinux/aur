# Maintainer: Romain Lebrun Thauront (Aeredren) <romain.lebrun-thauront at protonmail.com>

pkgname=efistub-standalone
pkgver=0.1
pkgrel=1
pkgdesc="/usr/lib/systemd/boot/efi/*.efi.stub files"
arch=('x86_64')
license=('unknown')
source=("linuxx64.efi.stub")
sha512sums=("72cea85ee90c15bad1730c83a35467b0bba2e522d598f7f406d0954bb49b5d84a7a9f9326c2ae1efd4eae6fb17e0d3ffaf5390398160562a3f8f005786118376")

package() {
  cd "$srcdir"
	install -Dm 755 "linuxx64.efi.stub" "${pkgdir}/usr/lib/systemd/boot/efi/linuxx64.efi.stub"
}
