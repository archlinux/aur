# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=cloudflare-warp-bin
pkgver=2021.10.0
pkgrel=1
pkgdesc="Cloudflare Warp Client"

url="https://developers.cloudflare.com/warp-client/"
license=("unknown")

depends=("glibc" "dbus")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')
conflicts=('cloudflare-warp')

# in ubuntu: apt-get --print-uris install cloudflare-warp
source=("http://pkg.cloudflareclient.com/pool/dists/focal/main/cloudflare_warp_2021_10_0_1_amd64_916ef55734_amd64.deb")

md5sums=('74db1c816442229cebfab10c66dc580e')
install=$pkgname.install

package() {
    mkdir ${pkgdir}/usr/
    tar -xzvf  data.tar.gz -C "${pkgdir}/usr/"
}
