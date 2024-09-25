# Maintainer: Faisal Ahmed Moshiur <faisalmoshiur+nerdfonts@gmail.com>
pkgname=nerdfonts-installer-bin
pkgver=2024.09.25.1
pkgrel=1
pkgdesc="A script to detect the OS and install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'unzip' 'fontconfig')
source=("https://github.com/fam007e/nerd_fonts_installer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('10446880c5f7e7c30a16886dc975dc597c4e88605acb0b7247e26218913ac6cd')

package() {
    cd "$srcdir/nerd_fonts_installer-${pkgver}"
    install -Dm755 "release/nerdfonts-installer" "$pkgdir/usr/bin/nerdfonts-installer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
