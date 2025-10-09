# Maintainer: Sofia Etchepare Daronco <sofia dot etchepare at acad dot ufsm dot br>

pkgname=mars-mips-bin
pkgver=4.5
pkgrel=1
pkgdesc='MIPS runtime (binary version)'
url='https://dpetersanderson.github.io'
license=('MIT')
arch=('any')
depends=('java-runtime')
source=('https://dpetersanderson.github.io/Mars4_5.jar')
noextract=('Mars4_5.jar')
sha256sums=('ac340b676ba2b62246b9df77e62f81ad4447bcfd329ab539716bcd09950b7096')

package() {
  install -Dm 0644 "$srcdir/Mars4_5.jar" -t "$pkgdir/usr/share/mars-mips"
  echo 'java -jar /usr/share/mars-mips/Mars4_5.jar' > mars-mips
  install -Dm 0755 mars-mips -t "$pkgdir/usr/bin"
}
