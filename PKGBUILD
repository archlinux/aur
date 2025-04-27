# Package maintainer: Julia van der Kris <juliavdkris@proton.me>

pkgname=diffsitter-bin
pkgver=0.9.0
pkgrel=1
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

sha256sums=('4cd13befb36d4035fade5ce44edb41ae601fd068e8088f7f0538128142ca65c6')
sha256sums_x86_64=('3496d7ae8dfdd3eba92edd1ccd68f79442ff86a48f30d54b4fd522e772e699b9')
sha256sums_i686=('01dcc1c22571efa0139088d261990d6bccb329399d0943bc6a0e968f3d9203a0')
sha256sums_arm=('224d18258f2796ce94d24da818578923cdb0f9917288a1d47865676644be6e61')
sha256sums_aarch64=('8f651d1db49c8ffb8974faaff442cc9dd8153b07271261da61380968e2db6957')

package() {
	install -Dm755 "$srcdir/diffsitter" "$pkgdir/usr/bin/diffsitter"
	install -Dm755 "$srcdir/git-diffsitter" "$pkgdir/usr/bin/git-diffsitter"
	install -Dm644 "$srcdir/diffsitter-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}
