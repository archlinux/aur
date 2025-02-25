# Maintainer: Andrew Koidan <deathangel908@gmail.com>
# Contributor: Alex Hirzel <alex at hirzel period us>
pkgname=cf-terraforming
pkgbase=cf-terraforming
pkgver=0.23.3
pkgrel=1
pkgdesc="Cloudflare Terraforming"
url="https://github.com/cloudflare/cf-terraforming"
license=("MPL-2.0")
arch=('x86_64')

source=(
    "${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cloudflare/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz"
)

sha256sums=('6e55f5ee520a40396ce1fd802b39fb5ecb3c75644cd2fcca14a66ae9a8b2fd6b')

prepare() {
  tar -xvzf "${pkgname}-${pkgver}-amd64.tar.gz"
}


package() {
  install -D -m755 "${srcdir}/cf-terraforming" "${pkgdir}/usr/bin/cf-terraforming"
}
