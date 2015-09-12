# Maintainer: Blackleg <blackleg@openaliasbox.org>

pkgname=unpacknbm
pkgver=1.0
pkgrel=1
pkgdesc="Bash script to unpack Netbeans module"
arch=('any')
url="https://github.com/blackleg/unpacknbm"
license=("GPLv3")
depends=('bash' 'findutils' 'coreutils' 'unzip' 'java-runtime-common')
source=(https://github.com/blackleg/unpacknbm/archive/${pkgver}.tar.gz)
md5sums=('ec9a7820894a5db79521bc2a7cb0d85c')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	install ${pkgname}  ${pkgdir}/usr/bin/
}
