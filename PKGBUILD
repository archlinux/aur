# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=zukitwo-themes
pkgver=20141022
pkgrel=1
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4, Gnome Shell and Unity."
arch=('any')
url="http://gnome-look.org/content/show.php/Zukitwo?content=140562"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
source=($pkgname-$pkgver.zip::http://gnome-look.org/CONTENT/content-files/140562-Zukitwo.zip)
sha1sums=('6e8896148b185b411be387972f40fda03b60844e')

package() {
  cd "$srcdir"
  find Zuki* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
