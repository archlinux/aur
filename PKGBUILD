# Maintainer: Aliaksei Ivanouski <alexei dot ivanovski at gmail dot com>
pkgname=kp-diff-bin
pkgver=0.6.0
pkgrel=2
pkgdesc='CLI utility to diff KeePass databases'
arch=('x86_64')
url='https://github.com/aivanovski/kp-diff'
license=('Apache')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}-linux-amd63.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-amd64.tar.gz")
sha256sums=('59e83014cf25bac7f38a78bf75126c04bafe23cb9d773ac813f3f668091408f2')

package() {
  install -Dm755 "${srcdir}/kp-diff-linux-amd64" "${pkgdir}/usr/bin/kp-diff"
}
