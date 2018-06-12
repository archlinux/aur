# Maintainer: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes"
arch=('i686' 'x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
conflicts=('shopify-themekit')

source_i686=("theme.i686::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-386/theme")
source_x86_64=("theme.x86_64::https://shopify-themekit.s3.amazonaws.com/v${pkgver}/linux-amd64/theme")
md5sums_i686=('c62833ae71340a73663d4a240c00e4d0')
md5sums_x86_64=('9b9770e282c998f664c6d6728e5d3df6')
sha256sums_i686=('2f2c4066b660bb8eafff6edb82a1356be4150738dc8831bf06187581f7a215da')
sha256sums_x86_64=('c2a6e006ae0e6d7152c9cd6a6097f60c7b2bbed2897b1c48269549285992a6aa')

package() {
  install -Dm0755 "${srcdir}/theme.${CARCH}" "${pkgdir}/usr/bin/theme"
}
