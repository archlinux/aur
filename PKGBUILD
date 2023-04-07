# Maintainer: Trevor Brunette <trevorbrunette@gmail.com>
pkgname='ezasm'
pkgver='1.3.2_beta'
_ver_hyphen="${pkgver//_/-}"
pkgrel=1
pkgdesc='An assembly-like programming language for use in education'
arch=('any')
url="https://github.com/ezasm-org/EzASM"
license=('MIT')
depends=('java-runtime=17')
source=("https://github.com/ezasm-org/EzASM-releases/releases/download/v${_ver_hyphen}/EzASM-${_ver_hyphen}-full.jar")
noextract=("EzASM-${_ver_hyphen}-full.jar")
sha256sums=('38de5b1b33ca7c4c450db583bcc4891200d89e3dfb6286fb8c20b440cf764758')

package() {
    mkdir -p "$pkgdir/usr/bin"
	cp "EzASM-${_ver_hyphen}-full.jar" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
