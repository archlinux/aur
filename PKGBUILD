# Maintainer: Colin Chartier <me@colinchartier.com>
# License: GNU General Public License; version 2
pkgname=cnijfilter2-bin
pkgver=5.10
pkgrel=1
pkgdesc="Binaries for canon printers. Tested for Pixma MX492"
arch=('x86_64')
url="https://www.usa.canon.com/internet/portal/us/home/support/details/printers/inkjet-multifunction/mx-series-inkjet/mx492"
license=('GNU General Public License v2')
depends=('cups')
options=('!emptydirs' '!strip')
install=$pkgname.install
source=("cnijfilter2-${pkgver}_amd64.deb::http://gdlp01.c-wss.com/gds/9/0100006669/01/cnijfilter2-${pkgver}-1-deb.tar.gz")
md5sums=('7dd81b16288dc0b46221d600e9541695')

package() {
  msg2 "Extracting the common debian archive."
  ar vx "cnijfilter2-${pkgver}-1-deb/packages/cnijfilter2_${pkgver}-1_amd64.deb"
  msg2 "Extracting the data.tar.gz component of the debian archive."
  tar xzvf data.tar.gz -C "$pkgdir/"
}
