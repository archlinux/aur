# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=soundfont-generaluser
pkgver=2.0.3
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
source=("GeneralUser_GS_v2.0.3--doc_r6.zip::https://drive.google.com/uc?export=download&id=12ZzM70Nxnr4vqyUF0bbRKE_HXQgLRNid")
sha256sums=('afc96a8f1cda270db376f0e70d43ca8f1aad4b337185ba017fc58ce9d3ff61b4')

package() {
  cd GeneralUser-GS
  install -Dm644 "GeneralUser-GS.sf2" "$pkgdir/usr/share/soundfonts/GeneralUser.sf2"
  install -Dm644 "documentation/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "documentation/README.pdf" "$pkgdir/usr/share/doc/$pkgname/README.pdf"
  install -Dm644 "support/GeneralUser GS.ins" "$pkgdir/usr/share/$pkgname/lists/GeneralUser GS.ins"
}

