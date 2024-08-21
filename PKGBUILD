# =====Pingpong's PKGBUILD=====
# @Author:     Bluemangoo
# @Maintainer: Serverbread

pkgname=pingpong
pkgver=0.3.0
pkgrel=1
pkgdesc="Reverse proxy powered by Pingora."
arch=('x86_64' 'aarch64' 'i686') 
url="https://github.com/Bluemangoo/Pingpong/"
license=('GPL')
maintainer="Serverbread <serverbread@163.com>"
source=("${pkgname}-${pkgver}-${arch}.zip"::"https://github.com/Bluemangoo/Pingpong/releases/download/${pkgver}/pingpong-${arch}-unknown-linux-gnu.zip")
depends=('bash' 'coreutils')
pkgrel=1
sha256sums=('f74fcd0c956b0d39eb872a48a0fb31da25acee5fccfacf6d3db61859f6ebcd48')
package() {
    install -Dm755 "${srcdir}/pingpong" "${pkgdir}/usr/bin/pingpong"
    install -Dm644 "${srcdir}/config/pingpong.toml" "${pkgdir}/etc/pingpong/pingpong.toml"
    install -Dm644 "${srcdir}/config/server.toml" "${pkgdir}/etc/pingpong/server.toml"
}
