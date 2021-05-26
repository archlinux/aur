# Maintainer: Leon Mergen <leon@solatis.com>

pkgname=cloudflare-warp-bin
pkgver=2021.5.0
pkgrel=1
pkgdesc="Cloudflare Warp Client"

url="https://developers.cloudflare.com/warp-client/"
license=("custom")

depends=("glibc")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')

source=("http://pkg.cloudflare.com/pool/buster/main/c/cloudflare-warp/cloudflare-warp_2021.5.0-1_amd64.deb")

sha256sums=('7a522a342b7a908e4d7a258e1e04e03291d0856a84f9f6630306b0935bcf85e6')


# TODO: install systemd files for warp-svc as well
package() {
    mkdir ${pkgdir}/usr/
    tar -xzvf  data.tar.gz -C "${pkgdir}/usr/"
}
