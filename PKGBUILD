# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=adbyss
pkgname=${_basename}-bin
pkgver=0.24.7
pkgrel=1
pkgdesc="DNS blocklist manager"
arch=('x86_64')
url="https://github.com/Blobfolio/${_basename}"
license=('WTFPL')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('95ea3d89921cdf065721b9ac3938ab49ebcafef544a20868307ed8bdfc243a34')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
} 
