pkgname=sudo-is-doas
pkgver=1.0
pkgrel=1
pkgdesc="Replaces sudo and softlinks doas to sudo"
arch=('x86_64')
url="https://github.com/dnorhoj/sudo-is-doas"
license=('GPL3')
depends=('opendoas')
provides=('sudo')
conflicts=('sudo')
replaces=('sudo')

package() {
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/bin/doas "$pkgdir/usr/bin/sudo"
}
