# Maintainer: Jon Wiersma (archaur at jonw dot org)
pkgname='matlab-segymat'
pkgdesc='Set of m files for loading SEG-Y files from Matlab and Octave'
pkgver='1.6'
pkgrel='3'
arch=('any')
url='https://cultpenguin.gitbooks.io/segymat/content/'
license=('lgpl')
optdepends=(
  'matlab: support for matlab',
  'octave: support for octave'
)
source=("http://downloads.sourceforge.net/sourceforge/segymat/segymat-$pkgver.zip")

package() {
  cd "segymat-$pkgver"
  install -d "$pkgdir/usr/share/matlab/SegyMAT"
  find * -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/matlab/SegyMAT/{}" \;
}

md5sums=('412018363da6df2bbe7a041b8b2f9b91')
