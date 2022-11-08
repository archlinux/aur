# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgname='dust-mail-client'

arch=('x86_64')

pkgdesc='A simple and fast mail client'

pkgver=0.2.1
pkgrel=1
epoch=1

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("https://github.com/Guusvanmeerveld/Dust-Mail/releases/download/${pkgver}/dust-mail_${pkgver}_amd64.deb")

md5sums=('e66cd41ee6ebe478b1dca7bb28c0814e')
sha256sums=('da05ca5c7466ec55d961a68f26a385a245f164be627e0e71619cefcbca47037e')

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  mkdir -p "$pkgdir/usr"

  cp "$srcdir/usr" "$pkgdir" -r
}
