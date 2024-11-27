# Maintainer: David H. Bronke <whitelynx at gmail dot com>

pkgname=artwiz-fonts-wl
pkgver=2.0.1
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
pkgdesc="A set of modified artwiz fonts based on artwiz-aleczapka and artwiz-latin1"
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
url="https://github.com/whitelynx/artwiz-fonts-wl"
# shellcheck disable=SC2034
license=('GPL2')
# shellcheck disable=SC2034
provides=('artwiz-fonts')
# shellcheck disable=SC2034
source=("https://github.com/whitelynx/${pkgname}/releases/download/${pkgver}/${pkgname}-otf-${pkgver}.tar.xz")
# shellcheck disable=SC2034
sha1sums=('8feab797622de6ae9bfe97f39a8425152472480f')
# shellcheck disable=SC2034
sha256sums=('fced044c9c942f282bb747eb3d03ea7e6b990aa667b3a64ffb87f26663a8a1b8')
# shellcheck disable=SC2034
sha512sums=('ca626b521c200e7dc00f943a9091e27cb850a90bfaf09c1509136fe5b15eab10798ae7831c3b48f8a3bc23f986d011175ae7c1583f679f0ff0a9babb3d60a42d')
# shellcheck disable=SC2034
b2sums=('fba48f9f0f1078ce968b3899ce7ccf3147bb3453f7e2ae59c964bc9d9472eaaef496c3290e1c5f0db33e64fe776b3e84a915dcc9630c65f03f0df6e69606df9b')

package() {
  # shellcheck disable=SC2154
  install -d "${pkgdir}/usr/share/fonts/artwiz-fonts-wl"
  install -p -m 0644 ./*.otf fonts.dir fonts.alias "${pkgdir}/usr/share/fonts/artwiz-fonts-wl"
}
