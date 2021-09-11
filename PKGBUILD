# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=qarnot-cli-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='CLI to use Qarnot computing service'
arch=('x86_64')
url='https://github.com/qarnot/qarnot-cli'
license=('APACHE')
provides=('qarnot-cli')
conflicts=('qarnot-cli')
options=(!strip)
depends=()
source=("https://github.com/qarnot/qarnot-cli/releases/download/v${pkgver}/qarnot-linux-x64")
md5sums=('44fb062b7dd2c10052125e50e3a22f0c')

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x qarnot-linux-x64
  install qarnot-linux-x64 "${pkgdir}/usr/bin/qarnot"
}
