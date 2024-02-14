# Maintainer: Toby Vincent <tobyv@tobyvin.dev>

pkgname=wmenu-dmenu
pkgver=1
pkgrel=2
pkgdesc="Symlink for using wmenu as a drop-in replacement to dmenu/dmenu-wayland"
arch=('any')
url="https://sr.ht/~adnano/wmenu"
license=('MIT')
depends=('wmenu')
provides=('dmenu' 'dmenu-wayland')
conflicts=('dmenu' 'dmenu-wayland')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s /usr/bin/wmenu "$pkgdir"/usr/bin/dmenu
  ln -s /usr/bin/wmenu "$pkgdir"/usr/bin/dmenu-wl
}
