# Maintainer: Afroz Saqlain <sqn3680@gmail.com>
pkgname=papr-bin
_pkgname=papr
pkgver=0.1.0
pkgrel=1
pkgdesc="A keyboard-first terminal workspace for academic papers"
arch=("x86_64")
url="https://github.com/AfrozSaqlain/Papr"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/papr-tui-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f317c4f0c9549951fd1e33fb15567fdf2c7fe000895711956098370722d39b5b')

package() {
    find "${srcdir}" -type f -name "${_pkgname}" -exec install -Dm755 {} "${pkgdir}/usr/bin/${_pkgname}" \;
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
