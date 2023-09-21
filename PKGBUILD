# Maintainer: Trevor Brunette <trevorbrunette@gmail.com>
pkgname='ezasm'
pkgver='1.0.2'
_ver_hyphen="${pkgver//_/-}"
pkgrel=1
pkgdesc='An assembly-like programming language for use in education'
arch=('any')
url="https://github.com/ezasm-org/EzASM"
license=('MIT')
depends=('java-runtime=17')
source=("https://github.com/ezasm-org/EzASM-releases/releases/download/v${_ver_hyphen}/EzASM-${_ver_hyphen}-full.jar")
noextract=("EzASM-${_ver_hyphen}-full.jar")
sha256sums=('f200cad932cd80d889d07ae0e4a0b688909b0250c495ac708714fc5d9a1ef812')

package() {
    mkdir -p "$pkgdir/usr/bin"
	mv "EzASM-${_ver_hyphen}-full.jar" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
