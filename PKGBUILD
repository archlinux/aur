# Maintainer: jay716 <13422525511 at 163 dot com>

pkgname=chfs
pkgver=3.1
pkgrel=2
pkgdesc="CuteHttpFileServer(CHFS) is a free, HTTP-protocol file-sharing server that is quickly accessible using a browser"
arch=('x86_64')
url='http://iscute.cn/chfs'
license=('custom')
source=("http://iscute.cn/tar/${pkgname}/${pkgver}/${pkgname}-linux-amd64-${pkgver}.zip")
sha256sums=('cf8a1787cdf84c355ef945d228f0595ccce3b325eb577a41af98180287e319c9')

package() {
  cd "${srcdir}"

  install -D -m755 "${srcdir}/chfs-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/chfs"
}

