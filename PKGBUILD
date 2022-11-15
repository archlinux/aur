# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgname='dust-mail-client'

arch=('x86_64')

pkgdesc='A simple and fast mail client'

pkgver=0.2.2
pkgrel=1
epoch=1

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("https://github.com/Guusvanmeerveld/Dust-Mail/releases/download/${pkgver}/dust-mail_${pkgver}_amd64.deb")

md5sums=('664e665855f6cacdbfa6b46f14338266')
sha256sums=('08af47bfd2b9a52ec2f9bbf172dffcfac38f071415ead599c29b33f3fec658dc')

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  mkdir -p "$pkgdir/usr"

  cp "$srcdir/usr" "$pkgdir" -r
}
