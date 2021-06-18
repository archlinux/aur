# Maintainer: Leon Mergen <leon@solatis.com>
# Co-Maintainer: Barfin
pkgname=cloudflare-warp-bin
pkgver=2021.6.1
pkgrel=2
pkgdesc="Cloudflare Warp Client"

url="https://developers.cloudflare.com/warp-client/"
license=("custom")

depends=("glibc")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')

source=("http://pkg.cloudflareclient.com/pool/main/cloudflare_warp_2021_6_1_1_amd64_09b03be4bb_amd64.deb")

sha256sums=('213777f19b7afd27d64579b32b63f5683d9541d1defaddafcfbafa05e9ce91e2')
install=$pkgname.install

package() {
    mkdir ${pkgdir}/usr/
    tar -xzvf  data.tar.gz -C "${pkgdir}/usr/"
}
