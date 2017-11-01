# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis 
pkgname=python2-treecorr
pkgver=3.3.7
pkgrel=1
#epoch=

pkgdesc="A package for efficiently computing 2-point and 3-point correlation functions "


arch=('x86_64')
url="https://pypi.python.org/packages/5a/59/466fca95804e60a4ad0cf34de70e92fd57e6a711d09fbf1f0f8d00f833de/TreeCorr-3.3.7.tar.gz#md5=54bdf201d7e8a52b5fa9ea5e1ff1d101"
license=('')
groups=()
depends=('python2' )
makedepends=('git')
checkdepends=()
optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=()
install=
changelog=
source=("${url}")
#noextract=()
md5sums=('54bdf201d7e8a52b5fa9ea5e1ff1d101')
#validpgpkeys=()


build() {
	cd "$src"	
	cd "TreeCorr-$pkgver"
	python2 setup.py build
}


package() {
	cd "$src"
	cd "TreeCorr-$pkgver"
	python2 setup.py install --root=${pkgdir} --prefix=/usr

}
