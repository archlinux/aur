# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>
# Contributor: Romain Lebrun Thauront (Aeredren) <romain.lebrun-thauront at protonmail.com>

pkgname=efistub-standalone-updated
pkgver=0.2
pkgrel=1
pkgdesc="/usr/lib/systemd/boot/efi/linuxx64.efi.stub file - updated to work with linux kernel 6.2 and beyond"
arch=('x86_64')
license=('unknown')
conflicts=('efistub-standalone')
source=("linuxx64.efi.stub")
sha512sums=("0bccb1b5a5f0e3de5645d67c9b55b688bcb8df50ad431241bd3852117e633d5c5aecf74accdfa1fe1c896ac8d2885124beb4b8380d950dfe1ed365dfe21c047f")

package() {
  cd "$srcdir"
	install -Dm 755 "linuxx64.efi.stub" "${pkgdir}/usr/lib/systemd/boot/efi/linuxx64.efi.stub"
}
