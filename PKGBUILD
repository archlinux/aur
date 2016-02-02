# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8
pkgver=1.0
pkgrel=1
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use."
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-8.otf")
sha512sums=('9f3a200845a2655d531954f0fa1d3f568307df9133e19a84993a9cdb0dea2dc989d9711d3bfc524d991607c7072f1083c808a4cd54c7fe217c3d0519bb192e1a')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8.otf"
}

# vim:set ts=2 sw=2 et:
