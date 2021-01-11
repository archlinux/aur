# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin-noconflict
pkgver=1.1.4
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes - renamed binary to theme-shopify"
arch=('x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
provides=('shopify-themekit')
conflicts=('shopify-themekit')

source=("theme-${CARCH}-${pkgver}::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-amd64/theme")
sha256sums=('f8a7850392066336498715a4510f7ce2c4e35496271902eca522582ff0ffc761')

package() {
  install -Dm0755 "${srcdir}/theme-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/theme-shopify"
}
