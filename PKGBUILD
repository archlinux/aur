# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=channelz
pkgname=${_basename}-bin
pkgver=0.12.9
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
sha256sums_x86_64=('c8fc8728c0c853f28513fbc752e79ab59ecd7ef0afc5994a0f9d701a45fa1791')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
