# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>

pkgname=twitter-media-downloader-bin
_pkgname=twitter-media-downloader
pkgver=1.15.0
pkgrel=1
pkgdesc="A tool to download media from Twitter (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mmpx12/twitter-media-downloader"
license=('unknown')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("https://github.com/mmpx12/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/mmpx12/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('3c3469764a9c7d27954e944d5ae6a06324615ea2ef5a26b2f9a34c58d3262eba')
sha256sums_aarch64=('fc1db9299092b74700ee76400fc0ce5714eef262dc6e2f3944934bc1d1ca49d0')

package() {
  install -Dm755 "${srcdir}/twitter-media-downloader" "${pkgdir}/usr/bin/twmd"
}
