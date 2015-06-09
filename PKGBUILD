# Maintainer: Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>
pkgname=ovito
pkgver=2.4.2
pkgrel=1
pkgdesc="OVITO is a scientific visualization and analysis software for atomistic simulation data."
url="http://www.ovito.org"
arch=('x86_64' 'i686')
license=('GPL3')
md5sums=('')
source=("http://sourceforge.net/projects/$pkgname/files/releases/$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")

if [[ $CARCH = i686 ]];then
  md5sums[0]='172af4d4b6b6f834adca7e9bde8c29b8'
else
  md5sums[0]='8f4929044173bd61bc0b1caa56219ba3'
fi

package() {
  cd ${pkgname}-${pkgver}-$CARCH
  install -d ${pkgdir}/usr
  rm -rf LICENSE.txt README.txt
  cp -dpr --no-preserve=ownership ./* ${pkgdir}/usr
}
 
# vim:set ts=2 sw=2 et:
