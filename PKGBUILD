# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8-fantasy
pkgver=1.0
pkgrel=1
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use. Full unicode support."
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-8-fantasy.otf")
sha512sums=('df90932a9ec3d52bace89a4ab51bd304e6b687dfd96fffc8743a62718bcbc60624a054f82e60da67504ab345d840a2c1e12bc9cc95d80e05add87a59e9786ec9')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8-fantasy.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8-fantasy.otf"
}

# vim:set ts=2 sw=2 et:
