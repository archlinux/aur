# Maintainer: Giulio Girardi <felixonmars at archlinux.org>

pkgname=soundfont-jeux
pkgver=2.4
pkgrel=1
pkgdesc="Jeux organ soundfont"
arch=('any')
url="http://realmac.info/jeux1.htm"
license=('custom:Public Domain')
source=("http://www.realmac.info/jeux14.sf2")
noextract=("jeux14.sf2")
md5sums=('44470f0a99b3819d057399f452a760ea')

package() {
  install -Dm0644 "$srcdir/jeux14.sf2" "$pkgdir/usr/share/soundfonts/jeux14.sf2"
}
