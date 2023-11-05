# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='mk870-keyboard-fix'
pkgver='0.1'
pkgrel='1'
pkgdesc='mk870 customized keyboard, key position repair.'
arch=('any')
license=('MIT')
source=("${pkgname}".conf)

sha256sums=('963f859855c58aee7e18df0f9bd570609d7b3246f9d9124ffd28b562a9ad11ae')

package() {
    install -dm755 "${pkgdir}"/etc/modprobe.d
    install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}"/etc/modprobe.d
}
