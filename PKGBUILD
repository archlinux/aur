# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
#
# Note: This font is propietary. You need to purchase it from the official
# website, and place it in the same directory as this PKGBUILD for it to work.
#
# This PKGBUILD exists merely for tracking installed font files and running any
# relevant hooks during installation.

pkgname=otf-operator-mono-nerd
pkgver=1.200
pkgdesc="Operator: the non-typewriter typewriter face. Configured with nerd-fonts."
pkgrel=3
arch=('any')
license=('custom:HCo')
url='https://www.typography.com/fonts/operator/overview/'
depends=('otf-operator-mono' 'ttf-nerd-fonts-symbols-mono')
provides=('ttf-font-nerd')
source=("80-operator-mono-nerd-fonts.conf")
sha256sums=('e3b8e79ad1a0fff7bc9a921640df4e7e4172cd7e8e7c185352b5d1e9e1528a38')

package() {
  install -Dm644 "$srcdir"/80-operator-mono-nerd-fonts.conf \
    "$pkgdir"/usr/share/fontconfig/conf.default/80-operator-mono-nerd-fonts.conf
}
