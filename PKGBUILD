# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-css-exfil-protection
pkgver=1.0.14
pkgrel=1
pkgdesc='Guard against CSS data exfiltration attacks'
url=https://www.mike-gualtieri.com/css-exfil-vulnerability-tester
arch=('any')
license=('MIT')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/931864/css_exfil_protection-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('18afef5ccd29876991d7364198cf3c74b984bfab1eeb614da91d6dfee8a812e2')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{7fc8ef53-24ec-4205-87a4-1e745953bb0d}.xpi
}

# vim:set ts=2 sw=2 et:
