# Maintainer: Trevor Brunette <trevorbrunette@gmail.com>
pkgname='ezasm'
pkgver='1.0.0'
_ver_hyphen="${pkgver//_/-}"
pkgrel=1
pkgdesc='An assembly-like programming language for use in education'
arch=('any')
url="https://github.com/ezasm-org/EzASM"
license=('MIT')
depends=('java-runtime=17')
source=("https://github.com/ezasm-org/EzASM-releases/releases/download/v${_ver_hyphen}/EzASM-${_ver_hyphen}-full.jar")
noextract=("EzASM-${_ver_hyphen}-full.jar")
sha256sums=('625620098438cac98a293a88e12d34db9727cac8a34d93096180e065115920cf')

package() {
    mkdir -p "$pkgdir/usr/bin"
	mv "EzASM-${_ver_hyphen}-full.jar" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
