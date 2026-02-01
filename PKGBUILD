# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=wallchemy-bin
_pkgname=wallchemy
pkgver=1.0.6
pkgrel=1
pkgdesc='CLI tool for fetching wallpapers from wallhaven.cc'
arch=('x86_64' 'aarch64')
url=https://github.com/davenicholson-xyz/${_pkgname}
license=('MIT')
depends=()
source_x86_64=("$url/releases/download/v$pkgver/${_pkgname}-linux-amd64-v$pkgver.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/${_pkgname}-linux-arm64-v$pkgver.tar.gz")
sha256sums_x86_64=('a70304f23d8a7e2995037cdc754074ac20ad0443b7935d4a02dceb0075b8f583')
sha256sums_aarch64=('8e5ec63a27d9ce15ea8ca37ab4bb34cbe784a9f4d7220075f0a138cf5d311ea1')
conflicts=('wallchemy')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
