# Maintainer: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes"
arch=('x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
conflicts=('shopify-themekit' 'discount')

source=("theme-${CARCH}-${pkgver}::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-amd64/theme")
sha256sums=('21a058bc47555ec343088c9322187bb0ad57e4055454f509c0751c092af6b12b')

package() {
  install -Dm0755 "${srcdir}/theme-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/theme"
}
