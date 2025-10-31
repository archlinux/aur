# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=fyi
pkgname=${_basename}-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="A dead-simple CLI status message printer for use in BASH scripts, etc"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('f1de16f015adad3094b1082026e7f501cd9921d65d43484d6705c364bc4af4bc')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
