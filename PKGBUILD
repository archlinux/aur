# Maintainer: mmoya <mmoya at mmoya dot org>

pkgname=maki-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="An efficient AI coding agent"
arch=('x86_64')
url="https://github.com/tontinton/maki"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/maki-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('f9db7f1c50c73568e40d9135e3e46242bd00633d7434b37368675121c95d1b4d')
options=('!debug')

package() {
    install -Dm755 maki "${pkgdir}/usr/bin/maki"
}
