# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-noscript-dev
pkgver=2.6.9.12rc1
pkgrel=1
pkgdesc='Allows JavaScript, Java (and other plugins) only for trusted domains of your choice.'
url=https://noscript.net
arch=('any')
license=('GPL')
depends=('firefox')
conflicts=('firefox-noscript')
source=("https://secure.informaction.com/download/betas/noscript-$pkgver.xpi")
sha256sums=('40cdf6eb7125314100a1f5eec300315cb2d03c77173d9519f001dbedb91ff3d8')

package() {
  local GLOBIGNORE=*.xpi:GPL.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{2b10c1c8-a11f-4bad-fe9c-1c11e82cac42}"

  install -d "$dstdir"
  cp -r * "$dstdir"
}

# vim:set ts=2 sw=2 et:
