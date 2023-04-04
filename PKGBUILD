# Maintainer: Trevor Brunette <trevorbrunette@gmail.com>
pkgname='ezasm'
pkgver='1.3.1_beta'
pkgrel=1
pkgdesc='An assembly-like programming language for use in education'
arch=('any')
url="https://github.com/ezasm-org/EzASM"
license=('MIT')
depends=('java-runtime=17')
source=("https://github.com/ezasm-org/EzASM-releases/releases/download/v${pkgver//_/-}/EzASM-${pkgver//_/-}-full.jar")
noextract=("EzASM-${pkgver//_/-}-full.jar")
sha256sums=('e479f3294274d10dc6d9bb08617705a7c26b2791fc879fe59cd9a9cd692afa02')

package() {
    mkdir -p "$pkgdir/usr/bin"
	cp "EzASM-${pkgver//_/-}-full.jar" "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
