pkgname=suru-icon-theme
pkgver=0.1
pkgrel=1
pkgdesc="Suru is a icon theme by Sam Hewitt, whose design is based upon and around the original Suru icon guidelines for Ubuntu mobile applications."
arch=('any')
url="https://snwh.org/suru"
license=("GPL")
depends=('git' 'gtk-update-icon-cache')
provides=('suru-icon-theme')
source=("${pkgname}::git+https://github.com/snwh/suru-icon-theme.git")
sha512sums=('SKIP')
package() {
  cd suru-icon-theme
  install -d "$pkgdir"/usr/share/icons/
  cp -r Suru/ "$pkgdir"/usr/share/icons/
}

