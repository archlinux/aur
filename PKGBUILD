# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Khashayar Naderehvandi <khashayar_naderehvandi@yahoo.co.uk>
# Contributor: imachine <m.jedrasik@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
pkgname=soundfont-unison
pkgver=1.00
pkgrel=3
pkgdesc="A lean and clean GM/GS soundbank"
arch=('any')
license=("custom")
url="http://www.personalcopy.com"
groups=('soundfonts')
source=("ftp://ftp.personalcopy.net/pub/Unison.sf2.gz")
md5sums=('6775aad100fd758dc8300c511e4cc09f')

package() {
  cd "$srcdir"
  install -D -m644 Unison.sf2 "$pkgdir/usr/share/soundfonts/Unison.sf2"
  # from the README.txt in the zip version
  echo "Unison is to be used for non-commercial purposes only! You may edit it for your own use, but do not distribute modified versions of Unison or any instruments/ sounds within that were created by me. EMU's terms and conditions of use apply to the rest of the instruments/sounds (Music Box, Jazz Guitar, Brass, Soprano Sax, Solo Vox, and Space Voice.)" > LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

