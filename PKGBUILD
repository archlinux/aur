# Maintainer: EndeavourOS-Team <info@endeavouros.com>
# Maintainer: Mikhail Velichko <efklid@gmail.com>

pkgname=reflector-bash-completion
pkgdesc="Bash completion support for 'reflector'"
pkgver=1.1
pkgrel=1
arch=('any')
license=('GPL')
depends=(bash-completion
         reflector)
url=https://github.com/endeavouros-team/PKGBUILDS/tree/master/$pkgname
_url="https://raw.githubusercontent.com/endeavouros-team/PKGBUILDS/master/$pkgname"

source=(
  $_url/$pkgname
)
sha512sums=('8fbe942db25cd85a786a4879cb383bc346ff363b3007c8de35453bba076f8033ff01acf05c1239822def4929b2f7adbbf4a1ad43e47cb6e8b3f63a7398b54d6d')

package() {
  install -Dm644 $pkgname  $pkgdir/usr/share/bash-completion/completions/reflector
}
