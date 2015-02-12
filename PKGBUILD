# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-noscript-dev
pkgver=2.6.9.14rc1
pkgrel=1
pkgdesc='Allows JavaScript, Java (and other plugins) only for trusted domains of your choice.'
url=https://noscript.net
arch=('any')
license=('GPL')
depends=('firefox')
conflicts=('firefox-noscript')
source=("https://secure.informaction.com/download/betas/noscript-$pkgver.xpi")
sha256sums=('8b0b000905ded802ba57c7270b52f554e91f20ffdbf1ce55de47577dc1f3a657')

package() {
  local GLOBIGNORE=*.xpi:GPL.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{73a6fe31-595d-460b-a920-fcc0f8843232}"

  install -d "$dstdir"
  cp -r * "$dstdir"
}

# vim:set ts=2 sw=2 et:
