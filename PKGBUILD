# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ctrdecrypt-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Decrypt module for cia-unix"
arch=('x86_64')
url="https://github.com/shijimasoft/ctrdecrypt"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'openssl')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/releases/download/v${pkgver}/${pkgname::-4}-linux-x86_64.zip")
sha256sums=('8b698e6f40dfa05da8bad5ea986b3952fab796ffc8da8780a0552159fb68e623')

package() {
	cd "$srcdir"
	install -Dm755 ${pkgname::-4} "$pkgdir/usr/bin/${pkgname::-4}"
}
