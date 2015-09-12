# Maintainer: Blackleg <blackleg@openaliasbox.org>

pkgname=unpacknbm
pkgver=1.1
pkgrel=1
pkgdesc="Bash script to unpack Netbeans module"
arch=('any')
url="https://github.com/blackleg/unpacknbm"
license=("GPLv3")
depends=('bash' 'findutils' 'coreutils' 'unzip' 'java-runtime-common')
source=(https://github.com/blackleg/unpacknbm/archive/${pkgver}.tar.gz)
md5sums=('2226f73cd00bb44e5bf627c0ce9c5f1f')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	install ${pkgname}  ${pkgdir}/usr/bin/
}
