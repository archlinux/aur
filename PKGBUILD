# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=clifton-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='SSH connection manager for Isambard-AI that retrieves signed SSH certificates'
arch=('x86_64' 'aarch64')
url='https://github.com/isambard-sc/clifton'
license=('MIT')
provides=('clifton')
conflicts=('clifton')

source_x86_64=("${url}/releases/download/${pkgver}/clifton-linux-x86_64")
source_aarch64=("${url}/releases/download/${pkgver}/clifton-linux-aarch64")
sha256sums_x86_64=('0053a16db9e6f1bcb17ed1b3f7402c8cbb68db50c250bb1c6ee3a0f187f83000')
sha256sums_aarch64=('d1d59611cf3c89e2d98485281091711918eb2a177a27522283f5149e7dd4263b')

package() {
    install -Dm755 clifton-linux-* "${pkgdir}/usr/bin/clifton"
}
