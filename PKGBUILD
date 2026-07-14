# Maintainer: mineleng <15119587808@163.com>
pkgname=hexhub-new
pkgver=5.1.9
pkgrel=1
pkgdesc="database, docker, ssh, sftp. all in one"
arch=('x86_64')
url="https://hexhub.cn"
license=('GPL')
depends=()
provides=('HexHub')
_pkgdate=202606072154
source=("HexHub-Client-linux-amd64-deb-${pkgver}-${_pkgdate}.deb::https://oss.hexhub.cn/plugin/HexHub-Client-linux-amd64-deb-${pkgver}-${_pkgdate}.deb")
sha256sums=('2acb2b03817bbd66a7072f912c570546f19ab0472b9b7da4af5ffff17512857c')

package() {
  bsdtar -xf "${srcdir}/HexHub-Client-linux-amd64-deb-${pkgver}-${_pkgdate}.deb" -C "${srcdir}" data.tar.xz
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
