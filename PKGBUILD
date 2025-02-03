# Maintainer: JisuWoniu <jswn@jswn9945.xyz>
# Contributor: Yumeoto_Zorin <zorin@zorin.icu>
pkgbase="ttf-lxgw-bright"
pkgname=("ttf-lxgw-bright" "ttf-lxgw-bright-gb" "ttf-lxgw-bright-tc")
pkgver="5.510"
pkgrel="1"
pkgdesc="A merged font of Ysabeau and LXGW WenKai."
arch=("any")
url="https://github.com/lxgw/LxgwBright"
license=("OFL")
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a91b0039e345286052bad11e407c363098c00ed3fecdb063020669aee24d4626')

build() {
  lsd --tree
  exit 1
}

package_ttf-lxgw-bright() {
  cd LxgwBright
  install -Dm644 LXGWBright/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  # shellcheck disable=SC2128
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-lxgw-bright-gb() {
  cd LxgwBright
  install -Dm644 LXGWBrightGB/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  # shellcheck disable=SC2128
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-lxgw-bright-tc() {
  cd LxgwBright
  install -Dm644 LXGWBrightGB/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  # shellcheck disable=SC2128
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
