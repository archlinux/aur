# Contributor: grimi <grimi at poczta dot fm>

pkgname=pidgin-emoticons-penguins
pkgver=1.8
pkgrel=1
pkgdesc="Pidgin port of Kadu penguins smileys"
arch=('any')
url="http://www.kde-look.org/content/show.php/Kadu+Penguins?content=66357"
license=('GPL')
depends=('pidgin')
source=("penguins-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/66357-Kadu%20Penguins-1.8.tar.gz" theme)
md5sums=('e39dde3d74336ed6dd0e9076b90cca2c'
         'fb5fec40acb9287bf442bb8ef3d54a1a')


package() {
  cd "Kadu Penguins"
  install -d "$pkgdir"/usr/share/pixmaps/pidgin/emotes/penguins
  install -m644 *.{gif,png} "$pkgdir"/usr/share/pixmaps/pidgin/emotes/penguins
  install -m644 "$srcdir"/theme "$pkgdir"/usr/share/pixmaps/pidgin/emotes/penguins
}

