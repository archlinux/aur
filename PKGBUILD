# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=whiskers-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A templating tool to simplify the creation of Catppuccin ports."
url="https://github.com/catppuccin/toolbox"
conflicts=('whiskers' 'whiskers-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/whiskers-v${pkgver}/whiskers-${arch}-unknown-linux-gnu")
sha256sums=('c1f6588ad551ac54ff1316b17dafb5edd77f97b1054d26479299366190bc2833')

package() {
    install -Dm755 whiskers-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/whiskers"
}
