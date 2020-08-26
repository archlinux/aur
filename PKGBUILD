#Maintainer: Larzid <larzid.dev@gmail.com>
pkgname=asetroot
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A lightweight animated wallpaper program for openbox & other light WMs"
arch=('x86_64')
url="https://github.com/Wilnath/asetroot"
license=('MIT')
groups=()
depends=('imlib2' 'libx11')
makedepends=('make' 'git')
checkdepends=()
provides=(asetroot)
replaces=()
backup=()
options=()
changelog=
source=('git+https://github.com/Wilnath/asetroot.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd asetroot
	make
	}

package() {
    install -D ${srcdir}/asetroot/asetroot ${pkgdir}/usr/bin/asetroot
    }
