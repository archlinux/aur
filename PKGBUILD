# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.7.2
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
sha256sums=('05294166a7ab4e65bf4f2aed1f90c94c8311911ccba4406b74b3ec87dc52bc78')
sha256sums_x86_64=('3d0d76f686bd46d4197bc8f74e8c10789906a171df14c834f5d31cc1815db553')
sha256sums_i686=('728d840d9082a175af97b7d4e3fd2db3945dfbe5f2bd4370479b85aad7751329')
sha256sums_arm=('233eea92ee2993c5f614323a5950c0f2238e5a0d6f019a6126a9e61b9fddce24')
sha256sums_aarch64=('d1957601a5e7b0758184f0b5a3f086cc22f638dc596bd54b03abc2925bbb6c4d')

package() {
    install -Dm755 "$srcdir/diffsitter-$CARCH-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

