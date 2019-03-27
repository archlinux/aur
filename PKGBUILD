# Maintainer: Martin Allien <martin at allien dot work>
pkgname=antudark-icons
pkgver=0.7
pkgrel=1
pkgdesc="Colorful, friendly and simple icon pack working nicely with dark themes"
arch=('any')
url="https://github.com/allienworks/${pkgname}"
license=('GPL3')
makedepends=('git')
provides=(${pkgname})
conflicts=(${pkgname})
changelog=CHANGELOG
source=("git+${url}.git")
md5sums=('SKIP')

package() {

  install -d -m 755 "$pkgdir"/usr/share/icons/AntuDark

  cd $srcdir/$pkgname/AntuDark
  cp -r . "$pkgdir"/usr/share/icons/AntuDark/

}
