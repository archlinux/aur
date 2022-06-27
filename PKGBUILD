# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=1.0.0_rc3
pkgrel=1

pkgdesc='Lightweight, native cross-platform implementation of cqhttp in Golang.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/Mrs4s/go-cqhttp/releases'
license=('AGPL3')
install=go-cqhttp-bin.install

optdepends=('ffmpeg: support voice sending in any format')

provides=('go-cqhttp')

origin_pkgver="v${pkgver//_/-}"

source_i686=("${pkgname}-i686-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_arm64.tar.gz")

sha512sums_i686=('0d1fdac7f2744f24d7f803a48e372d987593875c572d78d5efbb788da13be16585b5a91f93bc916b74e3b0358244299ed623962cd8543b47e87f3a17cdc75524')
sha512sums_x86_64=('269296f9afb9cea61829e71b66242044b5a5ece4262c0fb11e047abfb11a688884f8589dea77d96f3e3aa3dbd4468d872854ecdeb0e234d0d3ea85431d6a7228')
sha512sums_armv7h=('8de2c4b1f9ac60d60b8176d36c3422726a49c1e9a4e415000a3b2671cf6e094288b096d5a84f8a8f299e51ed161be9bf62dca9859d03afc464de77a027dc63c4')
sha512sums_aarch64=('ef99ae6501398b8b7ffa8ecbb56e689bd2a6e45eaf6124eb1b127383728f8f068461cf2c998da543647158ac325b799b368d62cfcefd5747ed93dfa25f7c95fd')

package() {
    cd "${srcdir}"
    install -Dm755 'go-cqhttp' "${pkgdir}/usr/bin/go-cqhttp"
}
