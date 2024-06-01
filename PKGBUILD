# =====Pingpong's PKGBUILD=====
# @Author:     Bluemangoo
# @Maintainer: Serverbread

pkgname=pingpong
pkgver=0.2.3
pkgrel=1
pkgdesc="Reverse proxy powered by Pingora."
arch=('x86_64' 'aarch64' 'i686') 
url="https://github.com/Bluemangoo/Pingpong/"
license=('GPL')
maintainer="Serverbread <serverbread@163.com>"
source=("${pkgname}-${pkgver}-${arch}.zip"::"https://github.com/Bluemangoo/Pingpong/releases/download/${pkgver}/pingpong-${arch}-unknown-linux-gnu.zip")
depends=('bash' 'coreutils')
pkgrel=1
sha256sums=('8d0f64c7e8a61113b449fc79d92d7f0a89f9e2ca829355fe42464588f778a273')
package() {
    install -Dm755 "${srcdir}/pingpong" "${pkgdir}/usr/bin/pingpong"
    install -Dm644 "${srcdir}/config/pingpong.toml" "${pkgdir}/etc/pingpong/pingpong.toml"
    install -Dm644 "${srcdir}/config/server.toml" "${pkgdir}/etc/pingpong/server.toml"
}