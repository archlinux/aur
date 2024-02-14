# Maintainer: Toby Vincent <tobyv@tobyvin.dev>

pkgname=wmenu-dmenu
pkgver=1
pkgrel=1
pkgdesc="Symlink for using wmenu as a drop-in replacement to dmenu"
arch=('any')
url="https://sr.ht/~adnano/wmenu"
license=('MIT')
depends=('wmenu')
provides=('dmenu')
conflicts=('dmenu')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s /usr/bin/wmenu "$pkgdir"/usr/bin/dmenu
}
