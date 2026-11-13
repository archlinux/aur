# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=channelz
pkgname=${_basename}-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="CLI tool to encode static assets with Gzip and Brotli"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('e351fa3a7c3d87331d28b6b9780bcfdfa42ed3248c3654e7b25c632e94c6caa2')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
