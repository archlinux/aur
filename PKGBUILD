# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
# Contribuor: JoveYu <yushijun110@126.com>
# Contribuor: wszqkzqk <wszqkzqk@gmail.com>
# Contribuor: luosoy <249799588@qq.com>

pkgname=deepin-udis86
_pkgname=udis86
_pkgver=1.72-4
pkgver=${_pkgver//-/_}
pkgrel=3
pkgdesc="Deepin Wine udis86"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('custom:proprietary')
makedepends=('tar')
conflicts=('udis86' 'udis86-git')
source=("https://community-packages.deepin.com/deepin/pool/non-free/u/${_pkgname}/${_pkgname}_${_pkgver}_i386.deb")
md5sums=('806a74d3da003d34340296a985432774')

package() {
    tar -xpvf data.tar.xz -C ${pkgdir}
}
