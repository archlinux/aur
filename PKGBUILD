# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=vkpeak
pkgname=${_pkgname}-bin
pkgver="20250531"
pkgrel="2"
pkgdesc="A tool which profiles Vulkan devices to find their peak capacities. (Binary Package)"
arch=("x86_64")
url="https://github.com/nihui/vkpeak"
license=("MIT")
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/nihui/vkpeak/releases/download/${pkgver}/vkpeak-${pkgver}-ubuntu.zip")

sha256sums_x86_64=("5d233c230d4dc14c43e76da3feb4a7374f9e79d0a0bbea00b1b8f33f6ac07eaf")

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/vkpeak-${pkgver}-ubuntu/vkpeak" "${pkgdir}/usr/bin/"
}
