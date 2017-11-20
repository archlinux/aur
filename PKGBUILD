# Maintainer: Marcel Robitaille mail@marcelrobitaille.me
pkgname=adeos-oblogout-git
pkgver=r27.dd25774
pkgrel=1
pkgdesc='A simple style theme for "oblogout", totally made with Inkscape and Love <3'
arch=('any')
url="https://github.com/bruhensant/Adeos-Oblogout"
license=('unknown')
depends=()
makedepends=('git')
source=('adeos-oblogout-git::git+https://github.com/bruhensant/Adeos-Oblogout')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cd "$srcdir/${pkgname}"
  cp -r adeos-branco "$pkgdir/usr/share/themes"
  cp -r adeos-cores "$pkgdir/usr/share/themes"
}

