# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=ifrextractor-rs
pkgname=${_pkgname}-bin
pkgver="1.6.1"
pkgrel="1"
pkgdesc="Rust utility to extract UEFI IFR data found in a binary file into human-readable text. (Binary Package)"
arch=('x86_64')
url="https://github.com/LongSoft/IFRExtractor-RS"
license=('BSD-2-Clause')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("https://github.com/LongSoft/IFRExtractor-RS/releases/download/v${pkgver}/ifrextractor_${pkgver}_Linux.zip")

sha256sums_x86_64=("5a18e253e560270387657d0165f317d7319cf6296cd5e58b1f13074557514c57")

package() {
    install -Dm755 "./ifrextractor" "${pkgdir}/usr/bin/ifrextractor"
}
