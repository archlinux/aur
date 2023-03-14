# Maintainer: Romain Lebrun Thauront (Aeredren) <romain.lebrun-thauront at protonmail.com>

pkgname=efistub-standalone
pkgver=0.2
pkgrel=1
pkgdesc="/usr/lib/systemd/boot/efi/*.efi.stub files"
arch=('x86_64')
license=('unknown')
source=("linuxx64.efi.stub")
sha512sums=("0bccb1b5a5f0e3de5645d67c9b55b688bcb8df50ad431241bd3852117e633d5c5aecf74accdfa1fe1c896ac8d2885124beb4b8380d950dfe1ed365dfe21c047f")

package() {
  cd "$srcdir"
	install -Dm 755 "linuxx64.efi.stub" "${pkgdir}/usr/lib/systemd/boot/efi/linuxx64.efi.stub"
}
