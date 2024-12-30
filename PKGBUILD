# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname="girlfriend-aur"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Your new girlfriend, Arch-chan"
arch=("x86_64")
license=('MIT')
source=("girlfriend.sh")
sha256sums=("SKIP")


package() {
	
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/girlfriend.sh" "${pkgdir}/usr/bin/girlfriend"
  	chmod +x "${pkgdir}/usr/bin/girlfriend"	
}
