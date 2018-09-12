# Maintainer: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes"
arch=('x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
conflicts=('shopify-themekit')

source_x86_64=("theme.x86_64::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-amd64/theme")
md5sums_x86_64=('7e66a3ebdb652be23d9a5b00b3544ca5')
sha256sums_x86_64=('7f14c2f755653fe0f67450a36364d38acbfe8da72934f22b7add52b6bf2162c1')

package() {
  install -Dm0755 "${srcdir}/theme.${CARCH}" "${pkgdir}/usr/bin/theme"
}
