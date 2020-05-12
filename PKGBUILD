# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=kite
pkgver=2.20200512.1
pkgrel=1
pkgdesc="Installer for Kite, the AI Coding Assistant for Python and JavaScript"
arch=('x86_64')
url="https://www.kite.com/"
license=('custom')
depends=('libxss')
source=("https://kitedownloadss.b-cdn.net/linux/${pkgver}/kite-installer")
md5sums=('14a53ada82df56b190e23a6411ac42e1')
install=${pkgname}.install

package() {
    install -Dm755 "${srcdir}/kite-installer" "${pkgdir}/opt/kite/kite-installer"
}
