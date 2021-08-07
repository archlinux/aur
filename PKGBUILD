# Maintainer: Leon Mergen <leon@solatis.com>
# Co-Maintainer: Barfin
pkgname=cloudflare-warp-bin
pkgver=2021.7.2
pkgrel=1
pkgdesc="Cloudflare Warp Client"

url="https://developers.cloudflare.com/warp-client/"
license=("custom")

depends=("glibc")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')

source=("http://pkg.cloudflareclient.com/pool/dists/focal/main/cloudflare_warp_2021_7_2_1_amd64_e749f2ca49_amd64.deb")

sha256sums=('16f496aa08fd065393ec4329f0ad723e6b875f3a10e76f158aa4b1ee40885b78')
install=$pkgname.install

package() {
    mkdir ${pkgdir}/usr/
    tar -xzvf  data.tar.gz -C "${pkgdir}/usr/"
}
