# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin-noconflict
pkgver=1.0.3
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes - renamed binary to theme-shopify"
arch=('x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
provides=('shopify-themekit')
conflicts=('shopify-themekit')

source=("theme-${CARCH}-${pkgver}::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-amd64/theme")
sha256sums=('d4bc86c6dca1d600f225391e0c2352aa2f3a9aef1fb8eebca777f41178dccf7e')

package() {
  install -Dm0755 "${srcdir}/theme-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/theme-shopify"
}
