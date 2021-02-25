pkgname=bluesky-mountain-dark-theme-git
_pkgname=bluesky
pkgver=f875342
pkgrel=1
pkgdesc="BlueSky-Mountain Dark theme for gtk2/3 and metacity"
arch=('any')
url="https://github.com/i-mint/bluesky"
license=('GPL3')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always
}

package() {
    # init dirs
    install -d ${pkgdir}/usr/local/share/themes
    # copy all files to package
    cp -a ${srcdir}/${_pkgname}/BlueSky-Mountain-Dark ${pkgdir}/usr/local/share/themes
}
