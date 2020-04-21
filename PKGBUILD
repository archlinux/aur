# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
#
# WARNING: THIS FONT IS PROPIETARY AND NOT FREE! YOU NEED TO PURCHASE THE FONT
# AND HAVE A LICENCE FOR IT IN ORDER TO USE THIS PACKAGE!

pkgname=otf-operator-mono-nerd
pkgver=1.200
pkgdesc="Operator: the non-typewriter typewriter face. Patched with nerd-fonts."
pkgrel=1
arch=('any')
license=('custom:HCo')
url='https://www.typography.com/fonts/operator/overview/'
source=("git+https://github.com/piq9117/operator-mono-nerdfont.git")
md5sums=("SKIP")

package() {
    cd "$srcdir/operator-mono-nerdfont"

    for font in *.otf; do
      install -Dm 644 "$font" "$pkgdir/usr/share/fonts/OTF/$font"
    done;
}
