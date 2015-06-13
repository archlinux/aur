# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=soundfont-generaluser
pkgver=1.44
pkgrel=1
pkgdesc="A small and well balanced GM/GS soundbank for many styles of music."
arch=('any')
license=("custom")
url="http://www.schristiancollins.com/generaluser.php"
groups=('soundfonts')
source=("http://www.schristiancollins.com/soundfonts/GeneralUser_GS_$pkgver-FluidSynth.zip")
md5sums=('34bf6e4c5fee079ce7f6a29fd72dd2c1')

package() {
  cd "GeneralUser GS $pkgver FluidSynth"
  install -Dm644 "GeneralUser GS FluidSynth v1.44.sf2" "$pkgdir/usr/share/soundfonts/GeneralUser.sf2"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/$pkgname/lists"
  install -m644 "instrument lists/"* "$pkgdir/usr/share/$pkgname/lists"
}

