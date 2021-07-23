# Maintainer: Leon Mergen <leon@solatis.com>
# Co-Maintainer: Barfin
pkgname=cloudflare-warp-bin
pkgver=2021.7.0
pkgrel=1
pkgdesc="Cloudflare Warp Client"

url="https://developers.cloudflare.com/warp-client/"
license=("custom")

depends=("glibc")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')

source=("https://pkg.cloudflareclient.com/uploads/cloudflare_warp_2021_7_0_1_amd64_44b51d5c11.deb")

sha256sums=('7cd0bcac979ad39ba2698f66a7f39d116558ce361b76ebad07045cf65e900fed')
install=$pkgname.install

package() {
    mkdir ${pkgdir}/usr/
    tar -xzvf  data.tar.gz -C "${pkgdir}/usr/"
}
