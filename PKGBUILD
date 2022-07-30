# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sopamo <github@sopamo.de>
pkgname=via-cli-bin
pkgver=v0.4.1
pkgrel=1
epoch=
pkgdesc="Easily start & stop your local dev environments from your cli"
arch=(x86_64)
url="https://github.com/Sopamo/via"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(via-cli)
conflicts=(via-cli)
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver-$arch::$url/releases/download/$pkgver/via-linux-$arch.tar.gz")
noextract=()
md5sums=('1e85c128e0529ff3112bce12ad8abf8c')
validpgpkeys=()

package() {
	install -Dm755 "via-linux-$arch" "${pkgdir}/usr/local/bin/via"
}
