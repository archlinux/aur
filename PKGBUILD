pkgname='sample-pkgbuild-with-backspaces-calls-sudo'
pkgver=1
pkgrel=3
pkgdesc="Sample PKGBUILD containing backspaces calls sudo (also [5mblinks[25m)[1A[13D9999 999.999)[1B"
arch=('any')
license=('GPL-3.0')

build() {
	sudo bash -c 'echo got $(whoami)'; #echo "this is a very small script with some innocent backspaces, don't worry"
}

package() {
	true
}
