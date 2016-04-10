# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-16-full
pkgver=1.0
pkgrel=2
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use. Full unicode support."
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-16-full.otf")
sha512sums=('0ddf040ab4a9e3e9e11ec12b9ce633de79812690d6f86fb67c1586d43e420de9ca743fa83701c23cebd3d8a27b62148869aef06f30ef3937b8d53d50958eca6c')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-16-full.otf" "$pkgdir/usr/share/fonts/OTF/unscii-16-full.otf"
}

# vim:set ts=2 sw=2 et:
