# Maintainer: DenBrahe <denbrahe at hotmail dot com>
# Contributor: Knowledge Representation and Reasoning research group, KU Leuven

_major_version=3.7
_minor_version=1

pkgname=idp
pkgver=${_major_version}.${_minor_version}
pkgrel=1
pkgdesc="Knowledge Base System"
arch=('i686' 'x86_64')
url="http://dtai.cs.kuleuven.be/software/idp"
license=('LGPL3')
install=idp.install
depends=('sh')
md5sums=('d46527d328da520d5096ee58a7bc0407')

_dirname="${pkgname}3-${_major_version}.${_minor_version}-Linux"

source=("https://dtai.cs.kuleuven.be/krr/files/releases/$pkgname/${_major_version}.${_minor_version}/${_dirname}.tar.gz")


package() {
	cd ${srcdir}
	rm ${_dirname}.tar.gz

	targetdir=${pkgdir}/
	mkdir -p ${targetdir}
	cp -dR ./${_dirname}/* ${targetdir}/
}
