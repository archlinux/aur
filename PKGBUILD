# Maintainer: Matthijs Tadema M.J.Tadema@gmail.com
pkgname="bin32-serialcloner"
_name="SerialCloner"
_binname="serialcloner"
_version="2-6"
pkgver=2.6.1
pkgrel=1
pkgdesc="Serial Cloner is a Molecular Biology software.
It provides tools with an intuitive interface that assists you in DNA cloning, sequence analysis and visualization."
arch=("i686" "x86_64")
url="http://serialbasics.free.fr"
license=('unknown')
depends=("lib32-gtk2")
source=("http://serialbasics.free.fr/Serial_Cloner-Download_files/${_name}${_version}.tar.gz")
md5sums=('3d29dcc0df72cf4793a6efcb76f8243b')
options=("!strip")

package() {
	mkdir -p $pkgdir/opt
	mkdir -p $pkgdir/usr/bin
	cp -r "${_name}${_version}" $pkgdir/opt/${_name}${_version}
	ln -s /opt/${_name}${_version}/${_name}${pkgver} $pkgdir/usr/bin/${_binname}
}
