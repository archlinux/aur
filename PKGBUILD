# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=latestpaper
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple Rust program that downloads the latest PaperMC "
arch=("x86_64")
url="https://github.com/ShayBox/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_x86_64-unknown-linux-musl.tar.gz")
sha256sums=("93442bdd24fed5151a8b9a34c254f3c15d65e454d63c594963cacf307298a826")

package() {
    install -Dm755 latest_paper "${pkgdir}/usr/bin/$_pkgname"
}
