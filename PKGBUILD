# Maintainer: Leon Mergen <leon@solatis.com>
# Co-Maintainer: Barfin
pkgname=cloudflare-warp-bin
pkgver=2021.8.1
pkgrel=3
pkgdesc="Cloudflare Warp Client"

url="https://developers.cloudflare.com/warp-client/"
license=("unknown")

depends=("glibc" "dbus")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')
conflicts=('cloudflare-warp')

# in ubuntu: apt-get --print-uris install cloudflare-warp
source=("http://pkg.cloudflareclient.com/pool/dists/focal/main/cloudflare_warp_2021_8_1_1_amd64_7c41aefd34_amd64.deb")

md5sums=('c58241c0eab1f12128f9be4087655b89')
install=$pkgname.install

package() {
    mkdir ${pkgdir}/usr/
    tar -xzvf  data.tar.gz -C "${pkgdir}/usr/"
}
