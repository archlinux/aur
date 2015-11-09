# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=saw-script

pkgver=0.1.1
pkgrel=2
pkgdesc="The SAW scripting language."
url="http://saw.galois.com/"
arch=('x86_64' 'i686')
license=('noncommercial')
depends=('cvc4' 'libtinfo' 'java-environment')
makedepends=()
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('')
provides=('saw-script')
md5sums=('SKIP')

source=('https://github.com/GaloisInc/saw-script/releases/download/v0.1.1-dev/saw-0.1.1-dev-2015-07-31-CentOS6-64.tar.gz')

#build() {
  #echo "HI"
#}

package() {
  cd $srcdir/"saw-0.1.1-dev-2015-07-31-CentOS6-64"
  mkdir -p "$pkgdir/usr/bin"
  cp bin/* "$pkgdir/usr/bin"
  #mkdir -p "$pkgdir/usr/share/cryptol"
  #mkdir -p "$pkgdir/usr/share/licenses/$_pkgname/"
  ##cp .cabal-sandbox/bin/cryptol "$pkgdir/usr/bin"
  #cp dist/build/cryptol/cryptol "$pkgdir/usr/bin"
  #cp lib/* "$pkgdir/usr/share/cryptol"
  #cp LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
}
