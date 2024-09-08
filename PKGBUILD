# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=cf-terraforming
pkgbase=cf-terraforming
pkgver=0.20.0
pkgrel=2
pkgdesc="Cloudflare Terraforming"
url="https://github.com/cloudflare/cf-terraforming"
license=("unknown")
arch=('x86_64')

source=(
    "${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cloudflare/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz"
)

md5sums=('b58f4d473c9e94cfb1eee1d647463613')
sha256sums=('5916f2c1bccfa26e324c704ed7c31946062cc0dd37bd2ae89576fc9fc2167136')

prepare() {
  tar -xvzf "${pkgname}-${pkgver}-amd64.tar.gz"
}


package() {
  install -D -m755 "${srcdir}/cf-terraforming" "${pkgdir}/usr/bin/cf-terraforming"
}
