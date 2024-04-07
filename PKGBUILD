# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=whiskers-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="A templating tool to simplify the creation of Catppuccin ports."
url="https://github.com/catppuccin/toolbox"
conflicts=('whiskers' 'whiskers-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/whiskers-v${pkgver}/whiskers-${arch}-unknown-linux-gnu")
sha256sums=('a3aad247adfc77b74dce85bb72d64894bcbe4d611c40d33d12c79bd9f1e315d1')

package() {
    install -Dm755 whiskers-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/whiskers"
}
