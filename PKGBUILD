# Maintainer: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes"
arch=('x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
conflicts=('shopify-themekit')

source=("theme-${CARCH}-${pkgver}::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-amd64/theme")
md5sums=('2a01f2c6d3c193525bb32b70e26d9e20')
sha256sums=('539e53dccfe8b8e78fe251a0186fb66352bed848f536025762145516bc215630')

package() {
  install -Dm0755 "${srcdir}/theme-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/theme"
}
