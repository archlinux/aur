# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pgbook-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Postgres Book in the terminal, one topic at a time"
arch=('x86_64' 'aarch64')
url="https://pgbook.dev"
license=('MIT')
provides=('pgbook')
conflicts=('pgbook')
options=('!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/pgrundev/pgbook/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pgrundev/pgbook/releases/download/v${pkgver}/pgbook_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pgrundev/pgbook/releases/download/v${pkgver}/pgbook_${pkgver}_linux_arm64.tar.gz")
sha256sums=('8245eafbbc7856840bd5b5e90ed15c607029c39f5c867bb09dd78cfa932ea990')
sha256sums_x86_64=('1ef8f0f87b963dadd40ef0b6aee20310fa86962449802118f10127a3dd9ce570')
sha256sums_aarch64=('ae9297f8b13e427c3e03506c0314b369850a32e78585dd947311d03bdf8a234d')

package() {
    install -Dm755 "${srcdir}/pgbook" "${pkgdir}/usr/bin/pgbook"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
