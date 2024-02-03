# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=catwalk-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A sweet program that takes in four showcase images and displays them all at once."
url="https://github.com/catppuccin/toolbox"
conflicts=('catwalk' 'catwalk-git')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/catwalk-v${pkgver}/catwalk-${arch}-unknown-linux-gnu")
sha256sums=('413459bb5cd6bd937c49bf9a6c10ab164bd05b1a7c09c2a0c2dac9a841fb9b06')

package() {
    install -Dm755 catwalk-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/catwalk"
}
