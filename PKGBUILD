# Maintainer: Aliaksei Ivanouski <alexei dot ivanovski at gmail dot com>
pkgname=kp-diff-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='CLI utility to diff KeePass databases'
arch=('x86_64')
url='https://github.com/aivanovski/kp-diff'
license=('Apache')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}-linux-amd63.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-amd64.tar.gz")
sha256sums=('e8d3ab466fe4ebd51290ee6d214fb8853127a2dc589d572d43a2aed909a52d59')

package() {
  install -Dm755 "${srcdir}/kp-diff-linux-amd64" "${pkgdir}/usr/bin/kp-diff"
}
