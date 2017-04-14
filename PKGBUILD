# Maintainer: HappyClown <giganitris@gmail.com>
pkgname=adventure-qnx
pkgver=0.0.0.1
pkgrel=2
epoch=
pkgdesc="A port of Colossal Cave Adventure to modern systems."
arch=('any')
url="https://github.com/Giganitris/Colossal-Cave-Adventure-port/"
license=('unknown')
groups=()
depends=("glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Giganitris/Colossal-Cave-Adventure-port/archive/QNX.zip")
noextract=()
md5sums=('ea7fff63e8d30dce0b6c66571c3c347a')
validpgpkeys=()

#prepare(){}

#pkgver(){} //coming soon!

build()
	{
	cd "Colossal-Cave-Adventure-port-QNX/QNX/Source"
	make
	}

#check(){} //coming soon!

package()
	{
	cd "Colossal-Cave-Adventure-port-QNX/QNX/Source"
	make DESTDIR="$pkgdir" install
	}
