# Maintainer: Faisal Ahmed Moshiur <faisalmoshiur+nerdfonts@gmail.com>
pkgname=nerdfonts-installer-bin
pkgver=2024.09.23.01
pkgrel=1
pkgdesc="A script to detect the OS and install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'tar' 'fontconfig')
source=("https://github.com/fam007e/nerd_fonts_installer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9177829361720d3a687a545bff85744494d7363d8212292514f00cba594450e8')

package() {
    cd "$srcdir/nerdfonts-installer-${pkgver}"
    install -Dm755 "nerdfonts-installer" "$pkgdir/usr/bin/nerdfonts-installer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
