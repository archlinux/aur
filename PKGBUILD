# Maintainer: JisuWoniu <jswn@jswn9945.xyz>
# Contributor: Yumeoto_Zorin <zorin@zorin.icu>
pkgbase="ttf-lxgw-bright"
pkgname=("ttf-lxgw-bright" "ttf-lxgw-bright-gb" "ttf-lxgw-bright-tc")
pkgver=5.528
pkgrel=1
pkgdesc="A merged font of Ysabeau and LXGW WenKai."
arch=("any")
url="https://github.com/lxgw/LxgwBright"
license=("OFL-1.1")
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd222c9f2a7fdea2057166cb5d862d8a8ae6cb9cb66f11e39569652e3f5fa856')

package_ttf-lxgw-bright() {
  cd "LxgwBright-$pkgver"
  install -Dm644 LXGWBright/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  # shellcheck disable=SC2128
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-lxgw-bright-gb() {
  cd "LxgwBright-$pkgver"
  install -Dm644 LXGWBrightGB/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  # shellcheck disable=SC2128
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-lxgw-bright-tc() {
  cd "LxgwBright-$pkgver"
  install -Dm644 LXGWBrightGB/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  # shellcheck disable=SC2128
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
