# Maintainer: Leon Mergen <leon@solatis.com>
# Co-Maintainer: Barfin
pkgname=cloudflare-warp-bin
pkgver=2021.8.1
pkgrel=1
pkgdesc="Cloudflare Warp Client"

url="https://developers.cloudflare.com/warp-client/"
license=("custom")

depends=("glibc")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')

# https://pkg.cloudflareclient.com/packages/cloudflare-warp
source=("https://pkg.cloudflareclient.com/uploads/cloudflare_warp_2021_8_1_1_amd64_7c41aefd34.deb")

sha256sums=('570c7a644ec7db9b3d42268f89364ed88488aace90555f833b52e2487b6a3847')
install=$pkgname.install

package() {
    mkdir ${pkgdir}/usr/
    tar -xzvf  data.tar.gz -C "${pkgdir}/usr/"
}
