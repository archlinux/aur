# Maintainer: Giulio Girardi <giulio at rapgenic.it>

pkgname=soundfont-jeux
pkgver=2.4
pkgrel=4
pkgdesc="Jeux organ soundfont"
arch=('any')
url="http://realmac.info/jeux1.htm"
license=('custom:Public Domain')
source=("https://www.realmac.info/Jeux14rev.rar")
noextract=("Jeux14rev.rar")
md5sums=('aec5602545283a50340fb80da8c3e316')
depends=('unrar')

prepare() {
  unrar e Jeux14rev.rar
}

package() {
  install -Dm0644 "$srcdir/Jeux14.SF2" "$pkgdir/usr/share/soundfonts/jeux14.sf2"
}
