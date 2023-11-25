# Maintainer: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8-fantasy
pkgver=2.1
pkgrel=1
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use. Full unicode support."
url="http://viznut.fi/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://viznut.fi/unscii/unscii-8-fantasy.otf")
sha512sums=('6267bb66880146d6c2f56a3412cb72a317a852d9af22682b6f6d34e1a04b84aaeba7c9c757cf778ffbb06ae254c94b1ef52001593aad9536e4a912651846e0de')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8-fantasy.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8-fantasy.otf"
}

# vim:set ts=2 sw=2 et:
