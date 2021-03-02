# Maintainer: Sebastian Makowiecki <soocki@mailbox.org>
# Contributor: Jaime Martínez Rincón <jaime@jamezrin.name>

pkgname=kite
pkgver=2.20210225.0
pkgrel=1
pkgdesc="Installer for Kite, the AI Coding Assistant for Python and JavaScript"
arch=('x86_64')
url="https://www.kite.com/"
license=('custom')
depends=('libxss')
source=("https://kitedownloadss.b-cdn.net/linux/${pkgver}/kite-installer")
md5sums=('2512cd541030f0cacfe87cb79688ff5b')
install=${pkgname}.install

package() {
    install -Dm755 "${srcdir}/kite-installer" "${pkgdir}/opt/kite/kite-installer"
}
