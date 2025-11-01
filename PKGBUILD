# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=guitar
pkgname=${_basename}-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Open source Git GUI Client"
arch=('x86_64')
url="https://github.com/soramimi/Guitar"
license=('GPL-2.0-only')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'qt6-base' 'qt6-svg')
source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums_x86_64=('460e3905f05ab9a9502c8cced155fa6f9e4603d76b86456b1cdbb0a40cff8862')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
