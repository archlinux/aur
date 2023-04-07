# Maintainer: Trevor Brunette <trevorbrunette@gmail.com>
pkgname='ezasm'
pkgver='1.3.3_beta'
_ver_hyphen="${pkgver//_/-}"
pkgrel=1
pkgdesc='An assembly-like programming language for use in education'
arch=('any')
url="https://github.com/ezasm-org/EzASM"
license=('MIT')
depends=('java-runtime=17')
source=("https://github.com/ezasm-org/EzASM-releases/releases/download/v${_ver_hyphen}/EzASM-${_ver_hyphen}-full.jar")
noextract=("EzASM-${_ver_hyphen}-full.jar")
sha256sums=('890c4998a1d84dccb195c933120863637dcedd7240d3a46f7486d037d6a07e07')

package() {
    mkdir -p "$pkgdir/usr/bin"
	mv "EzASM-${_ver_hyphen}-full.jar" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
