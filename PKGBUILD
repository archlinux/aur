# Maintainer: take100yen <take100yen at gmail dot com>
pkgname=cnijfilter-mg7100
pkgver=4.00
pkgrel=1
pkgdesc="Canon InkJet Printer driver for MG7100 series"
url="https://cweb.canon.jp/drv-upd/ij-mfp/linux-pd-mg7130-400.html"
arch=('x86_64')
license=('custom')
depends=('cnijfilter-common')
source=("http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNTUxMjAx")
md5sums=('83bc4c91e968edb2377767ae049d6741')

package() {
  local _debdir="cnijfilter-mg7100series-4.00-1-deb/packages"
  cd "${srcdir}/${_debdir}"
  ls
  ar -x "cnijfilter-mg7100series_4.00-1_amd64.deb" data.tar.gz
  tar -xzf data.tar.gz
  cp ${srcdir}/${_debdir}/usr/ ${pkgdir}/usr -r
}
