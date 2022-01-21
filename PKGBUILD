# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.6.9
pkgrel=1
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
url="https://github.com/afnanenayet/diffsitter"
provides=('diffsitter')
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/diffsitter-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$url/releases/download/v$pkgver/diffsitter-i686-unknown-linux-gnu.tar.gz")
source_arm=("$url/releases/download/v$pkgver/diffsitter-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/diffsitter-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('fe05933eaf87a8705441ee81f1027dbf85d07c3fd7fdf6197a4c299a9392f6fb')
sha256sums_x86_64=('5e487d2d0298cf5f428a70466512f5217f1670286bf81eb3d2254f5f4424678c')
sha256sums_i686=('4deca23dd57b244fafa2feb960c9e5fe25662295864966ec50c747f6fa404eeb')
sha256sums_arm=('b29073442db995fc0b41e053d6b105861668f46490fba11df5a768b505b03798')
sha256sums_aarch64=('808ff5f56d0ec33074f555ef87ad0f2c1d14748f5dbe1d5f2b9ed996995eac7f')

package() {
    install -Dm755 "$srcdir/diffsitter-$CARCH-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

