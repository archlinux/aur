# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=htminl
pkgname=${_basename}-bin
pkgver=0.11.4
pkgrel=1
pkgdesc="CLI tool that simplifies the task of minifying HTML in-place for production environments"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('e83cf48f37b5bc19fd757b42a2fb9caa88d9e163a2296c3d62280d497bf098f1')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
