# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=wallchemy-bin
_pkgname=wallchemy
_pkgauthor="davenicholson-xyz"
pkgver=1.0.6
pkgrel=2
pkgdesc='CLI tool for fetching wallpapers from wallhaven.cc'
arch=('x86_64' 'aarch64')
url=https://github.com/${_pkgauthor}/${_pkgname}
license=('MIT')
depends=('glibc')
source=("https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/refs/heads/main/LICENSE")
source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${_pkgname}-linux-arm64-v${pkgver}.tar.gz")
sha256sums=('ddee4d347b66b481a33906f023475e07c4c590f2ac3a889df597b95f803af1d1')
sha256sums_x86_64=('a70304f23d8a7e2995037cdc754074ac20ad0443b7935d4a02dceb0075b8f583')
sha256sums_aarch64=('8e5ec63a27d9ce15ea8ca37ab4bb34cbe784a9f4d7220075f0a138cf5d311ea1')
conflicts=('wallchemy')

package() {
	install -Dm744 "LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
