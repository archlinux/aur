# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=channelz
pkgname=${_basename}-bin
pkgver=0.12.5
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
sha256sums_x86_64=('2f36ba020f2f6a1b65b29031db2529397e1b088b744862f44ff8e06cb1dcec29')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
