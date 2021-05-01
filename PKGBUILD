# Maintainer: jay716 <13422525511 at 163 dot com>

pkgname=chfs
pkgver=2.0
pkgrel=1
pkgdesc="CuteHttpFileServer(CHFS) is a free, HTTP-protocol file-sharing server that is quickly accessible using a browser"
arch=('x86_64')
url='http://iscute.cn/chfs'
license=('custom')
source=("http://iscute.cn/tar/${pkgname}/${pkgver}/${pkgname}-linux-amd64-${pkgver}.zip")
sha256sums=('ef14f7cb385054d7e23121d94b673810e3a67c80e3efdb179068e4ad6bb58cd1')

package() {
  cd "${srcdir}"

  install -D -m755 "${srcdir}/chfs" "${pkgdir}/usr/bin/chfs"
}

