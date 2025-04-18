# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=soundfont-generaluser
pkgver=2.0.1
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
source=("GeneralUser_GS_v2.0.1--doc_r3.zip::https://drive.google.com/uc?export=download&id=18BH0mhjvZr-lQ4tCQ-R-X9dh4ZPT829N")
sha256sums=('8a8c8ae91720984e0cd67416fd5a8c392caeb1adfd586bc9e48c7aad8f4b1fe1')

package() {
  cd GeneralUser-GS
  install -Dm644 "GeneralUser-GS.sf2" "$pkgdir/usr/share/soundfonts/GeneralUser.sf2"
  install -Dm644 "documentation/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "support/GeneralUser GS.ins" "$pkgdir/usr/share/$pkgname/lists/GeneralUser GS.ins"
}

