pkgname=zuki-themes
pkgver=3.22.1
_pkgver=3.22-1
pkgrel=1
pkgdesc="A selection of themes for GNOME, Xfce and more (includes Zukitwo and Zukitre)."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'ttf-roboto')
source=("zuki-themes-$_pkgver.tar.gz::https://github.com/lassekongo83/zuki-themes/archive/v$_pkgver.tar.gz")
md5sums=('f8450a20c46360aef5b820db2f1f50ea')

package() {
  install -d -m755 "$pkgdir"/usr/share/{themes,licenses/$pkgname}
  cd "zuki-themes-$_pkgver"
  cp -rp Zuki* "$pkgdir"/usr/share/themes
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/
}
