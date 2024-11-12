# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ifrextractor-rs
pkgname=${_pkgname}-bin
pkgver="1.5.1"
pkgrel="1"
pkgdesc="Rust utility to extract UEFI IFR data found in a binary file into human-readable text. (Binary Package)"
arch=('x86_64')
url="https://github.com/BoringBoredom/UEFI-Editor"
license=('BSD-2-Clause')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/LongSoft/IFRExtractor-RS/releases/download/v${pkgver}/ifrextractor_v${pkgver}_Linux.zip")

sha256sums_x86_64=("314701c4a5822970f82040733ef8d524052138f452334441ceb2db16cd1932c8")

package() {
    install -Dm755 "./ifrextractor" "${pkgdir}/usr/bin/ifrextractor"
}
