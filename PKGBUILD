# Maintainer: Solti Csongor Péter <csps0@users.noreply.github.com>
pkgname=pala-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Interaktív terminálos felület (TUI) a Kréta e-napló rendszerhez."
arch=('x86_64')
url="https://github.com/CsPS0/pala"
license=('MIT')
options=('!strip')
provides=('pala' 'folio-cli')
conflicts=('pala' 'folio-cli-bin' 'folio-cli')
replaces=('folio-cli-bin')
source=("pala-linux-${pkgver}::https://github.com/CsPS0/pala/releases/download/v${pkgver}/pala-linux")
sha256sums=('cd9737fd23a72483d6e2b6b8e9078d2737e0d07a6f1a01617f6bf615a1529f06')

package() {
    install -Dm755 "${srcdir}/pala-linux-${pkgver}" "${pkgdir}/usr/bin/pala"
}

