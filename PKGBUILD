# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.6.7
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
sha256sums=('ccb012a54d908bf0aa999beb10f36e37f44457712f0ffd12711ebe778c083945')
sha256sums_x86_64=('a152a52546e04a6dc2ea15d3cfa0b0665b52dcde5dc3fe2fe9b726e44a9713c1')
sha256sums_i686=('dd344578c2545b283c8361809a304136925b0108889d614dead850a28eeaa0d0')
sha256sums_arm=('6ea43f99076f6a014f019b1306124a438144d34260968c1748f999babcc2c740')
sha256sums_aarch64=('9581cf727aa8ece902e751a5624504c92b738937ab1dd730c5df949775e442da')

package() {
    install -Dm755 "$srcdir/diffsitter-$arch-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

