# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=channelz
pkgname=${_basename}-bin
pkgver=0.12.6
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
sha256sums_x86_64=('20c34bbfb38f4f52c5c5c73515e056d91fe369e9025437855a264382d976afed')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
