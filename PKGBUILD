# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-css-exfil-protection
pkgver=1.1.0
pkgrel=1
pkgdesc='Guard against CSS data exfiltration attacks'
url=https://www.mike-gualtieri.com/css-exfil-vulnerability-tester
arch=('any')
license=('MIT')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/931864/css_exfil_protection-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('1e31940698d3c5477a6980688ba21125d70afff21e02915956d4b0386d44ab5d')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7fc8ef53-24ec-4205-87a4-1e745953bb0d}.xpi
}

# vim:set ts=2 sw=2 et:
