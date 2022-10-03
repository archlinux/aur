# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=latestspigot
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple Rust program that downloads and builds the latest Spigot"
arch=("x86_64")
url="https://github.com/ShayBox/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_x86_64-unknown-linux-musl.tar.gz")
sha256sums=("b72bc0c4c21074389cb17a110331d002321294078212e088a9f8bb40867e9d46")

package() {
    install -Dm755 latest_spigot "${pkgdir}/usr/bin/$_pkgname"
}
