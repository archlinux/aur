# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=zuki-themes
pkgver=3.14_1  
pkgrel=1
pkgdesc="A selection of themes for GNOME, Xfce and more (includes Zukitwo and Zukitre)."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
source=("https://github.com/lassekongo83/zuki-themes/archive/v${pkgver//_/-}.tar.gz")
sha1sums=('0a3920c6fdddcf8ac0c5d2678d9694994244a03d')
install="$pkgname.install"

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
