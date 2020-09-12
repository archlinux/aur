# Maintainer: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=kite
pkgver=2.20200825.0
pkgrel=1
pkgdesc="Installer for Kite, the AI Coding Assistant for Python and JavaScript"
arch=('x86_64')
url="https://www.kite.com/"
license=('custom')
depends=('libxss')
source=("https://kitedownloadss.b-cdn.net/linux/${pkgver}/kite-installer")
md5sums=('8b95c7010059900d4ecf2fb5865cb898')
install=${pkgname}.install

package() {
    install -Dm755 "${srcdir}/kite-installer" "${pkgdir}/opt/kite/kite-installer"
}
