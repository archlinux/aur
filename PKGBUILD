# Maintainer: Aiden "Acey" Sognatore theaidency [at] gmail [dot] com
pkgname="makesndwch"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Order Tux to make a sandwich for you."
arch=("x86_64")
source=(makesndwch.sh)
sha256sums=('411c2c1dae4b96c23d368d49434297c3c4a46aa96fd7f64e3729575e36acb560')

package(){
	echo "${srcdir}/makesndwch.sh"
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/makesndwch.sh" "${pkgdir}/usr/bin/makesndwch"
	chmod +x "${pkgdir}/usr/bin/makesndwch"
	echo 'Your local resident Tux is now capable of making you a sandwich.'
}

