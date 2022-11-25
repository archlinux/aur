pkgname=dummy_gen
pkgver=1.0
pkgrel=1
pkgdesc="A simple generator for Arch-compatible dummy packages"
arch=('any')
url="http://mindflayer.sytes.net/miscdev/"
license=('GPL-3.0')
provides=('dummy_gen')
conflicts=('idefkmanyoutellme')
depends=('zsh'
         'wget'
        )

package() {
  wget http://mindflayer.sytes.net/miscdev/dummy_gen
  wget http://mindflayer.sytes.net/miscdev/libm1ndflay3r_zsh
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/local/lib
  install -m755 dummy_gen "$pkgdir"/usr/bin/dummy_gen
  install -m644 libm1ndflay3r_zsh "$pkgdir"/usr/local/lib/libm1ndflay3r_dummygen_zsh
}
