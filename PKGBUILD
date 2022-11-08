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

md5sums=('ee68be2e3172b9060ea7b3e7aaf76f00')
sha256sums=('27347bf6b021e32f600f8f64f0b26c77b9afc989766ab61c83bb1f2cf9949458')

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  mkdir -p "$pkgdir/usr"

  cp "$srcdir/usr" "$pkgdir" -r
}
