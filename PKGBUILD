# Maintainer: Christophe Robin <crobin at nekoo a-dot com>
# Why no integrity?
#   Because the develop of Manager releases several versions a week,
#   all using the same URL. I guess I could run something on my server
#   that updates this file when that happens but I don't have the time
#   at the moment, hence no integrity for now.

pkgname=manager.io
pkgver=16.10.26
pkgrel=1
pkgdesc="Manager is free accounting software for small business."
arch=('i686' 'x86_64')
url="http://www.manager.io"
source=("manager-v${pkgver}.deb::https://mngr.s3.amazonaws.com/Manager.deb")

package() {
  msg2 "Extracting the data.tar.gz"
  tar -xf data.tar.xz -C "${pkgdir}/"
}

md5sums=('5804e0e7d79328601cda439c21d71e46')

