# Maintainer: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes"
arch=('x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
conflicts=('shopify-themekit')

source=("theme-${CARCH}-${pkgver}::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-amd64/theme")
md5sums=('d7d4e2ac3fc751edbca0346d07ef1654')
sha256sums=('d65bbb83bb006ab20f7c4e5fea82d3131a150683684e616002eef556b905489f')

package() {
  install -Dm0755 "${srcdir}/theme-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/theme"
}
