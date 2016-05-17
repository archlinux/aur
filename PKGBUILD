# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=hmap2
pkgver=20121222
pkgrel=1
pkgdesc="BSP compile tools for Quake 1"
arch=(i686 x86_64)
license=("GPL")
source=("https://icculus.org/twilight/darkplaces/files/${pkgname}build${pkgver}.zip")
md5sums=("d99f8b76d40875d91148c9a07e46fd6c")
url="https://icculus.org/twilight/darkplaces/index.html"

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm777 hmap2 "${pkgdir}/usr/bin/hmap2"
}
