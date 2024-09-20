# Package maintainer: Julia van der Kris <juliavdkris@proton.me>

pkgname=diffsitter-bin
pkgver=0.8.4
pkgrel=3
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
url="https://github.com/afnanenayet/diffsitter"
provides=('diffsitter')
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('MIT')

source=("$url/archive/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/diffsitter-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$url/releases/download/v$pkgver/diffsitter-i686-unknown-linux-gnu.tar.gz")
source_arm=("$url/releases/download/v$pkgver/diffsitter-arm-unknown-linux-gnueabi.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/diffsitter-aarch64-unknown-linux-gnu.tar.gz")

sha256sums=('3440e9e1c4e2e359092ec1cc35812d53efe9e56535148af140bbb131c59b500c')
sha256sums_x86_64=('c00f3edb2a27f4daf214b01f54a7f0166d37aeb2088be88e3af2e31d18f06618')
sha256sums_i686=('78546e02792b94f5c159dd8ef9ac0c7ab0c410830ef6319875f988ae41cb706f')
sha256sums_arm=('8d694a1dca7c54e85a6cc9b8d1cb6b5d53eb300d1a9155392cb6faa1bead8ac6')
sha256sums_aarch64=('80b46093b7f286bf456089192e7740d3a221eed6bd04422a87aefac2c1659ada')


package() {
	install -Dm755 "$srcdir/diffsitter" "$pkgdir/usr/bin/diffsitter"
	install -Dm755 "$srcdir/git-diffsitter" "$pkgdir/usr/bin/git-diffsitter"
	install -Dm644 "$srcdir/diffsitter-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}
