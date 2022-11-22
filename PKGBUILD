# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgname='dust-mail-client'

arch=('x86_64')

pkgdesc='A simple and fast mail client'

pkgver=0.2.4
pkgrel=1
epoch=1

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("https://github.com/Guusvanmeerveld/Dust-Mail/releases/download/${pkgver}/dust-mail_${pkgver}_amd64.deb")

md5sums=('SKIP')
sha256sums=('SKIP')

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  mkdir -p "$pkgdir/usr"

  cp "$srcdir/usr" "$pkgdir" -r
}
