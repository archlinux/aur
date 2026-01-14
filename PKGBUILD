# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ifrextractor-rs
pkgname=${_pkgname}-bin
pkgver="1.6.0"
pkgrel="1"
pkgdesc="Rust utility to extract UEFI IFR data found in a binary file into human-readable text. (Binary Package)"
arch=('x86_64')
url="https://github.com/LongSoft/IFRExtractor-RS"
license=('BSD-2-Clause')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/LongSoft/IFRExtractor-RS/releases/download/v${pkgver}/ifrextractor_${pkgver}_Linux.zip")

sha256sums_x86_64=("33ee4cd5eba9b9d2807028054e63c42381cfad5846c224f3d5354084d69f04ee")

package() {
    install -Dm755 "./ifrextractor" "${pkgdir}/usr/bin/ifrextractor"
}
