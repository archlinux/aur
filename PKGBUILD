# Maintainer: DeepChirp <DeepChirp@outlook.com>
# Contributor: LS-Shandong < ls-shandong at outlook dot com >
pkgname=bookget-bin
pkgver=25.0701
pkgrel=1
pkgdesc="数字古籍图书下载工具，已支持约 50+ 个数字图书馆。"
arch=('x86_64')
url="https://github.com/deweizhu/bookget"
license=('GPL-3.0-only')
provides=(${pkgname%-bin})
conflicts=("${pkgname%-bin}-git"
           "${pkgname%-bin}")
depends=(glibc)
optdepends=('dezoomify-rs: Zoomable image downloader for Google Arts & Culture, Zoomify, IIIF, and others')
options=('!debug')
source=("${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux")
sha256sums=('44d973a48c649e8f5786bc51f988f8f482e6d66628863639fd87f108bdb9653c')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
