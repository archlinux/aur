# Maintainer: Robiot <robiot#5485>

pkgname=rustcat
_binname=rc
pkgver=0
pkgrel=1
pkgdesc="Rustcat - Like Netcat but in Rust"
url="https://github.com/robiot/rustcat"
license=('MIT')
arch=('x86_64')

source=("rc::https://github.com/robiot/rustcat/releases/latest/download/rc")
conflicts=("${pkgname}" "${pkgname}-bin" "${pkgname}-git")

package() {
    cd "${srcdir}"
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/${pkgname}
    cp -r . ${pkgdir}/usr/share/${pkgname}
    ln -s /usr/share/${pkgname}/${_binname} ${pkgdir}/usr/bin/${_binname}
}
md5sums=('SKIP')
