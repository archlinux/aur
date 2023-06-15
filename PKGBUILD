# Maintainer: Matthijs Tadema <m dot j dot tadema at pm dot me>
pkgname=ananas-nanod-bin
pkgver=1.1
pkgrel=1
pkgdesc="Analytical Analyzer of  Symmetries is a software for detection and assessment of the quality of symmetry in a protein assembly. It can compute axes of symmetry for any type of point groups."
arch=("x86_64")
url="https://team.inria.fr/nano-d/software/ananas/"
license=('unknown')
source=("https://files.inria.fr/NanoDFiles/Website/Software/AnAnaS/${pkgver}/Linux/ananas-linux.zip")
md5sums=('eb17b1c9800f185f496be003852cb08f')

prepare() {
    cd $srcdir
    yes | unzip ananas-linux.zip
}

package() {
	cd $srcdir
    install -d $pkgdir/usr/bin/ 
    install $srcdir/ananas $pkgdir/usr/bin
}
