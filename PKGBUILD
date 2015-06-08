# Contributor: grimi <grimi at poczta dot fm>

pkgname=gajim-penguins
pkgver=1.8
pkgrel=2
pkgdesc="Kadu Penguins emoticons, adopted for gajim"
arch=('any')
url="http://www.kde-look.org/content/show.php/Kadu+Penguins?content=66357"
license=('GPL')
depends=('gajim')
source=("penguins-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/66357-Kadu%20Penguins-1.8.tar.gz" \
        "emoticons.py")
md5sums=('e39dde3d74336ed6dd0e9076b90cca2c'
         '33403f80daeda338437d39782cc65008')

package() {
  cd "$srcdir/Kadu Penguins"
  install -d "$pkgdir"/usr/share/gajim/data/emoticons/penguins
  install -m644 *.gif "$pkgdir"/usr/share/gajim/data/emoticons/penguins
  install -m644 "$srcdir"/emoticons.py \
           "$pkgdir"/usr/share/gajim/data/emoticons/penguins
}

