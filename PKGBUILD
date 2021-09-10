# Maintainer: Robiot <robiot#5485>

pkgname=rustcat
_binname=rc
pkgver=1.1.1
pkgrel=4
pkgdesc="Rustcat - Like Netcat but in Rust"
url="https://github.com/robiot/rustcat"
license=('MIT')
arch=('x86_64')

source=("rc.tar.gz::https://github.com/robiot/rustcat/releases/download/v${pkgver}/rustcat_${pkgver}_amd64-linux.tar.gz")
conflicts=("${pkgname}" "${pkgname}-bin" "${pkgname}-git")

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/${pkgname}
    cp -r . ${pkgdir}/usr/share/${pkgname}
    ln -s /usr/share/${pkgname}/${_binname} ${pkgdir}/usr/bin/${_binname}
}
md5sums=('SKIP')
