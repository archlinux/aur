# Maintainer: Alessio Biancone <alebian1996@gmail.com>
pkgname=biscuit-kms
pkgver=0.1.4
pkgrel=1
pkgdesc="simple key-value store for your infrastructure secrets."
arch=('x86_64')
url="https://github.com/dcoker/biscuit.git"
license=('Apache')
makedepends=('go' 'gox' 'tar')
source=("https://github.com/dcoker/biscuit/releases/download/v${pkgver}/biscuit_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('a116620ec37548c0204b32dbfd98810a910d01e80b2cc448dac58e4f413161ad')

package() {
        tar -xvzf "biscuit_${pkgver}_Linux-64bit.tar.gz"

	install -D -m755 "biscuit" "${pkgdir}/usr/bin/biscuit"
}
