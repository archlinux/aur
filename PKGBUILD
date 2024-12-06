# Maintainer: Andrew Koidan <deathangel908@gmail.com>
# Contributor: Alex Hirzel <alex at hirzel period us>
pkgname=cf-terraforming
pkgbase=cf-terraforming
pkgver=0.21.0
pkgrel=1
pkgdesc="Cloudflare Terraforming"
url="https://github.com/cloudflare/cf-terraforming"
license=("MPL-2.0")
arch=('x86_64')

source=(
    "${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cloudflare/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz"
)

md5sums=('0ffcc2ab2e250e9cfcf536a9e1b4bdfe')
sha256sums=('bbedbe65b5cd5c9f341312078fc99181e569771157e9253c252fd0c484d4c1b2')

prepare() {
  tar -xvzf "${pkgname}-${pkgver}-amd64.tar.gz"
}


package() {
  install -D -m755 "${srcdir}/cf-terraforming" "${pkgdir}/usr/bin/cf-terraforming"
}
