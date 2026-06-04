# Maintainer: Solti Csongor Péter <csps0@users.noreply.github.com>
pkgname=folio-cli-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A modern, fast CLI application for the Hungarian Kreta e-diary system."
arch=('x86_64')
url="https://github.com/CsPS0/folio-cli"
license=('MIT')
provides=('folio-cli')
conflicts=('folio-cli')
source=("folio-cli-linux-${pkgver}::https://github.com/CsPS0/folio-cli/releases/download/v${pkgver}/folio-cli-linux")
sha256sums=('a2fa26b22c19735fddbc802221b04f62cd462443df381be2df650000c213aadf')

package() {
    install -Dm755 "${srcdir}/folio-cli-linux-${pkgver}" "${pkgdir}/usr/bin/folio-cli"
}
