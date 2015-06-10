# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=gimp-script-descreen
pkgver=1.0
pkgrel=4
pkgdesc="A GIMP script that does descreening using the FFT Fourier plugin."
arch=('any')
url="http://registry.gimp.org/node/24411"
license=('none')
depends=('gimp' 'gimp-fourier')
source=(http://registry.gimp.org/files/descreen.scm)
sha256sums=('4f789e64a010e4e25ba34dee1e4b93db52583bde8616288417d1469481242e81')

package(){
  cd "$srcdir"
  install -Dm0644 descreen.scm \
    "$pkgdir"/usr/share/gimp/2.0/scripts/descreen.scm
}
