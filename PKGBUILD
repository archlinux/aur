# Maintainer: Faisal Ahmed Moshiur <faisalmoshiur+nerdfonts@gmail.com>
pkgname=nerdfonts-installer-bin
pkgver=2024.09.23.1
pkgrel=1
pkgdesc="A script to detect the OS and install Nerd Fonts"
arch=('x86_64')
url="https://github.com/fam007e/nerd_fonts_installer"
license=('MIT')
depends=('curl' 'tar' 'fontconfig')
source=("https://github.com/fam007e/nerd_fonts_installer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dfe624b7c46717ce7d67e8c67aad5dca32428eb4e659f03b5d885c426b0bb2b6')

package() {
    cd "$srcdir/nerd_fonts_installer-${pkgver}"
    install -Dm755 "release/nerdfonts-installer" "$pkgdir/usr/bin/nerdfonts-installer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
