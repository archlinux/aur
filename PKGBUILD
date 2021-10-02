# Maintainer: Robiot <robiot#5485>

pkgname=rustcat
_binname=rcat
pkgver=2.0.0
pkgrel=5
pkgdesc="Rustcat - A Modern Port Listener & Reverse Shell"
url="https://github.com/robiot/rustcat"
license=('MIT')
arch=('x86_64')

source=("rc.tar.gz::https://github.com/robiot/rustcat/releases/download/v${pkgver}/rustcat_${pkgver}_amd64-linux.tar.gz")
conflicts=("${pkgname}" "${pkgname}-bin" "${pkgname}-git")
md5sums=('SKIP')

package() {
    cd "${srcdir}"
    install -Dm 755 "./${_binname}" "$pkgdir/usr/bin/$_binname"
}
