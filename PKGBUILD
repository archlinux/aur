# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=cf-terraforming
pkgver=0.12.0
pkgrel=1
pkgdesc="Cloudflare Terraforming"
url="https://github.com/cloudflare/cf-terraforming"
license=("unknown")
arch=('x86_64')

source=(
    "${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cloudflare/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz"
)

md5sums=('c53e9337397761a04d963343c6daf7ff')
sha256sums=('c2955c03994e38c4628c6445dfb760e4c6ee93319f621e9254a24440eb17aa33')

prepare() {
  tar -xvzf "${pkgname}-${pkgver}-amd64.tar.gz" 
}


package() {
  install -D -m755 "${srcdir}/cf-terraforming" "${pkgdir}/usr/bin/cf-terraforming"
}
