# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.7.1
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
sha256sums=('256237d05eed800f338ec937807b2d8fb966af62c3aaccd6c3023efbf8a0e388')
sha256sums_x86_64=('d5cc6514bcd4c01cfae490e46c0c189d385bae76c5d26e5791708b56789227ad')
sha256sums_i686=('7e466e33563593c168319ff9c80d25a79a5205192054f1157a0c0ea1de4232c5')
sha256sums_arm=('a32070d9358fa96f1f4e617419e41d36635f979f42f1659a11e2e3e3f4b49808')
sha256sums_aarch64=('4802894e4db174cab5250b00e97d7aabed45514a5f86dda22287fb4662090903')

package() {
    install -Dm755 "$srcdir/diffsitter-$CARCH-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

