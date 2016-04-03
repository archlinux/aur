# Maintainer: Filippo Veneri <filippo[dot]veneri[at]gmail[dot]com>

pkgname=acpilight
pkgver=0.1
pkgrel=1
pkgdesc="A backward-compatibile xbacklight replacement based on ACPI"
arch=('any')
url="https://github.com/wavexx/acpilight"
license=('GPL3')
depends=('python')
provides=('xbacklight')
conflicts=('xorg-xbacklight')
source=(${pkgname}-${pkgver}.zip::https://github.com/wavexx/acpilight/archive/master.zip)
md5sums=('1c252d6edf0efb1e1cb5a1ecb70aaf00')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}-master/xbacklight" "${pkgdir}/usr/bin/xbacklight"
}
