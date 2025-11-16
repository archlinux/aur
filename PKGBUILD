# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname='dolphin-anty-bin'
pkgver=2025.315.171
pkgrel=1
pkgdesc='Antidetect browser for multi-accounting'
arch=('x86_64')
url='https://dolphin-anty.net/'
license=('custom:Proprietary')
options=(!strip)
provides=('dolphin-anty')

source_x86_64=('https://dolphin-anty-cdn.com/anty-app/dolphin-anty-linux-x86_64-latest.rpm')
sha256sums_x86_64=('3929d6e83bfe449056dfb72e2f703d9337e0c14e1c98b34e5d5a55d6730d5432')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}"
    cp -a "${srcdir}/opt" "${pkgdir}"
}

