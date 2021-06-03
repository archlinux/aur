# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=zoho-cliq
pkgver=1.4.9
pkgrel=1
pkgdesc='Zoho Cliq communication software'
arch=('x86_64')
url="https://www.zoho.com/cliq/desktop/linux.html"
license=('Proprietary')
source=(
    "https://downloads.zohocdn.com/chat-desktop/linux/cliq-${pkgver}.rpm"
)
sha256sums=('c5b641048373ae19a843add6637c07c4978a76627db797ddc0f4d632c4fbd1cd')

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/share"
    cd ${srcdir}/
    cp -r opt/Cliq "${pkgdir}/opt/Cliq"
    cp -r usr/share/* "${pkgdir}/usr/share/"
}
