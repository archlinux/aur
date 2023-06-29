# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-bin
pkgver=v0.5.4
pkgrel=1
pkgdesc="Curl impersonate scripts and executable. Libcurl is a special compilation of curl that makes it impersonate Firefox and Chrome"
url="https://github.com/lwthiker/curl-impersonate"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=(nss)
provides=(curl-impersonate-chrome curl-impersonate-firefox)

source_x86_64=(
  "curl-impersonate_x86_64.tar.gz::https://github.com/lwthiker/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_aarch64=( 
  "curl-impersonate_aarch64.tar.gz::https://github.com/lwthiker/curl-impersonate/releases/download/${pkgver}/curl-impersonate-${pkgver}.aarch64-linux-gnu.tar.gz"
)

md5sums_x86_64=('bc3fa875c62548d00f24f8a983de6508')
md5sums_aarch64=('a715557815a0a3aa85bee207bbb8d875')

package () {
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 curl_* "${pkgdir}/usr/bin/"
  install -Dm755 curl-impersonate-* "${pkgdir}/usr/bin/"
}
md5sums_x86_64=('bc3fa875c62548d00f24f8a983de6508')
md5sums_aarch64=('a715557815a0a3aa85bee207bbb8d875')
