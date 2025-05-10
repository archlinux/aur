# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=soundfont-generaluser
pkgver=2.0.2
pkgrel=1
pkgdesc="A small and well balanced GM/GS soundbank for many styles of music."
arch=('any')
license=("custom")
url="http://www.schristiancollins.com/generaluser.php"
groups=('soundfonts')
#source=("http://www.schristiancollins.com/soundfonts/GeneralUser_GS_$pkgver-FluidSynth.zip")
#source=("https://dl.dropboxusercontent.com/u/8126161/GeneralUser_GS_$pkgver.zip")
makedepends=('gdown')
DLAGENTS=('https::/usr/bin/gdown -O %o %u')
source=("GeneralUser_GS_v2.0.2--doc_r4.zip::https://drive.google.com/uc?export=download&id=1UJ1mrY2l_C_YbKeyywNUymBz7OTVzQLU")
sha256sums=('a1b17a4362558e91777bea878a1945419ae680b9e59a5ac0d1fd300bce4bdc2a')

package() {
  cd GeneralUser-GS
  install -Dm644 "GeneralUser-GS.sf2" "$pkgdir/usr/share/soundfonts/GeneralUser.sf2"
  install -Dm644 "documentation/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "support/GeneralUser GS.ins" "$pkgdir/usr/share/$pkgname/lists/GeneralUser GS.ins"
}

