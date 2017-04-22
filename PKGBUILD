# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=habitat-bin
pkgver=0.21.0
_builddate=20170421003135
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
source=("https://dl.bintray.com/habitat/stable/linux/x86_64/hab-${pkgver}-${_builddate}-x86_64-linux.tar.gz")
sha256sums=('46ccad0abe8314314233c6267501e9e5ad38cacb5c075103a0d46db3df2edc91')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-x86_64-linux/hab" "${pkgdir}/usr/bin/hab"
}
