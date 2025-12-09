# Maintainer: Andrew Koidan <deathangel908@gmail.com>
# Contributor: Alex Hirzel <alex at hirzel period us>
pkgname=cf-terraforming
pkgbase=cf-terraforming
pkgver=0.24.0
pkgrel=1
pkgdesc="Cloudflare Terraforming"
url="https://github.com/cloudflare/cf-terraforming"
license=("MPL-2.0")
arch=('x86_64')

source=(
    "${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cloudflare/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz"
)

sha256sums=('35eb5c975f5c3ed7e7b822d665bb5cd533a1804d92625d4d62163ff3eaf12b49')

prepare() {
  tar -xvzf "${pkgname}-${pkgver}-amd64.tar.gz"
}


package() {
  install -D -m755 "${srcdir}/cf-terraforming" "${pkgdir}/usr/bin/cf-terraforming"
}
