# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Contributor: ying <Jinoto Systems>

pkgname=neuropolitical-ttf
pkgver=1.0
pkgrel=4
url="http://www.dafont.com/neuropolitical.font"
license=('custom')
pkgdesc="Neuropolitical custom font"
arch=('any')
source=("neuropolitical.zip::http://dl.dafont.com/dl/?f=neuropolitical")
install=$pkgname.install

prepare() {
  mv "neuropolitical rg.ttf" "Neuropolitical-R.ttf"
}

package()
{
  mkdir -p $pkgdir/usr/share/fonts/ttf-neuropolitical 
  install -Dm 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/ttf-neuropolitical/
  
  install -Dm 644 $srcdir/read-this.html ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html
  install -Dm 644 $srcdir/typodermic-eula-02-2014.pdf ${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf
}

md5sums=('ec37003c45f0cbeb2f7c05c9a7b49818')
