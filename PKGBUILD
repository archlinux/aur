pkgname=prince-pl
pkgver=1
pkgrel=1
pkgdesc="Książę i tchórz"
arch=(any)
url=http://wiki.scummvm.org/index.php/The_Prince_and_the_Coward
license=(abandonware)
depends=(scummvm)
source=(https://www.dropbox.com/s/wa863jc78m4qzde/Ksiaze_i_tchorz.zip)
sha256sums=(27b9bb372a207406053646969454d6e08df18184ef587e96af030336f665eb44)

package() {
  mkdir -p $pkgdir/usr/share/prince-pl/
  cd gra/
  cp -r ??/ voices/ $pkgdir/usr/share/prince-pl/
  cp -r ALL/ $pkgdir/usr/share/prince-pl/all/
  cp -r SOUND/ $pkgdir/usr/share/prince-pl/sound/
}
