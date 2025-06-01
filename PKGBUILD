# Maintainer: decipher <decipher3114@gmail.com>

_package_name=capter
pkgname="$_package_name-bin"
pkgver=4.0.0
pkgrel=1
epoch=
pkgdesc="Cross-Platform Screen Capture and Annotation Tool (prebuilt binary)"
arch=('x86_64')
url="https://github.com/decipher3114/Capter"
license=('Apache-2.0')

depends=(
    libayatana-appindicator
)
provides=("${_package_name}")
conflicts=("${_package_name}")
replaces=("${_package_name}")

source=(
    "${_package_name}-${pkgver}.tar.gz::${url}/releases/latest/download/capter_${pkgver}_x86_64.tar.gz"
)
sha512sums=(
    "1fb6ba46ecb8c0d9ab630e0fda481ed7560e69a10e12c7bce52023107a16e408ae257eb84c13c777f66d94a4a26d2e6521b7ec6eefb40a64a35a02e3721b49aa"
)

package() {
    cp -r "${srcdir}/"/* "${pkgdir}/"
}
