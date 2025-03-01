# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=vkpeak
pkgname=${_pkgname}-bin
pkgver="20240505"
pkgrel="1"
pkgdesc=" (Binary Package)"
arch=("x86_64")
url="https://github.com/nihui/vkpeak"
license=("MIT")
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/nihui/vkpeak/releases/download/${pkgver}/vkpeak-${pkgver}-ubuntu.zip")

sha256sums_x86_64=("4a5b06915e1c03c8adad4593abb4012d4eb927d4aa3f0c90f0879d98c90ac674")

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/vkpeak-${pkgver}-ubuntu/vkpeak" "${pkgdir}/usr/bin/"
}
