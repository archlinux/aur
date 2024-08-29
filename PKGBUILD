# Maintainer: Terrasse <terrasse@qq.com>
pkgname=chsrc
pkgver=0.1.8
pkgrel=1
pkgdesc="A cli tool to change source for every software on every platform"
arch=('x86_64') # TODO: add more archs
url="https://github.com/RubyMetric/chsrc"
license=('GPL-3.0-or-later' 'MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$url/releases/download/v$pkgver/chsrc-x64-linux"
	"https://raw.githubusercontent.com/RubyMetric/chsrc/v$pkgver/LICENSE-MIT.txt"
)
noextract=()
sha256sums=('551a84f3bf267d2ceb039fcd097990a1f862c4a7dbc1fc7910e829b61ae2f571'
            'cde8b285b49b2552f5fcd0509c89aac9c862ac74df7e6c91d89a0fd49dc686a4')
validpgpkeys=()

package() {
	install -Dm 755 chsrc-x64-linux $pkgdir/usr/bin/chsrc
	# MIT License
	install -Dm 644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/$pkgname
}
