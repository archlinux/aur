# Maintainer: Félix Saparelli <aur@passcod.name>
pkgname=radio-france
pkgver=1.1
pkgrel=1
pkgdesc="Ouvrir n'importe quelle station de Radio France depuis la CLI"
arch=('any')
url="https://github.com/passcod/pkgs"
license=('Public Domain')
depends=('mimeo' 'ruby' 'ruby-fuzzy-match' 'ruby-i18n')
source=('radio-france')
sha512sums=('67d89c72075778acffb6d349931c7a2db1f48c18a8f7aacb60c7d72b9ea92ce6420f9f4ee1fbc73f51d351240d815f9daa16283f3e980984e53ed67ff128e099')
package() {
  cd $srcdir
  bin="$pkgdir/usr/bin"
  mkdir -p $bin
  cp $pkgname $bin/$pkgname
  chmod +x $bin/$pkgname
}
