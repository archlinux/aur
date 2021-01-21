# Maintainer: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes"
arch=('x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
conflicts=('shopify-themekit' 'discount')

source=("theme-${CARCH}-${pkgver}::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-amd64/theme")
sha256sums=('e063cff188f43d9180e10131fdd70089d7cfdaffa79e0c1da8f8289d9ee24037')

package() {
  install -Dm0755 "${srcdir}/theme-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/theme"
}
