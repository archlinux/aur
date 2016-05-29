pkgname=numix-cinnamon-transparent-git
pkgver=2.6.r22.3554b02
pkgrel=1
pkgdesc="Transparent version of Numix-Cinnamon Theme with shorter window list's tab"
arch=('any')
url='https://github.com/edoz90/numix-cinnamon-transparent'
license=('AGPL3')
depends=('git')
source=('git+https://github.com/edoz90/numix-cinnamon-transparent.git')
md5sums=('SKIP')

pkgver() {
  cd numix-cinnamon-transparent
  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

package() {
  mkdir -p "$pkgdir/usr/share/themes/Numix-Cinnamon-Transparent/"
  cp -r "numix-cinnamon-transparent/Numix-Cinnamon-Transparent" "$pkgdir/usr/share/themes/"
}
