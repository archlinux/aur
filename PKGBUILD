# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>

pkgname=matrilineare-icon-theme
_pkgname=Matrilineare
pkgver=0.3
pkgrel=2
pkgdesc="Matrilineare Icon Theme by Andrea Soragna"
arch=('any')
url="https://sora-meliae.deviantart.com/art/Matrilineare-version-0-3-321379531"
license=('GPL3')
depends=('gtk-update-icon-cache')
provides=('matrilineare-icon-theme')
conflicts=('matrilineare-icon-theme')
source=('https://orig08.deviantart.net/c047/f/2013/287/b/4/matrilineare__version_0_3__by_sora_meliae-d5bca17.zip')
sha256sums=('c29da22b903e58a5c1b6aa2e6c76453eba0d57894be4f3e45efbb2ea4b29ae35')

package() {

  # create icon theme dir
  install -d -m 755 "$pkgdir"/usr/share/icons/$_pkgname

  # install icon theme
  cd $srcdir/$_pkgname/
  cp -dr --no-preserve='ownership' ./ "$pkgdir"/usr/share/icons/$_pkgname
  find "$pkgdir"/usr/share/icons/$_pkgname -type d -exec chmod 755 {} +
}