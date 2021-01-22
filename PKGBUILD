# Maintainer: @RubenKelevra
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>
pkgname=ipfs-cluster-bin
pkgver=0.13.0
pkgrel=1
epoch=1
pkgdesc="ipfs-cluster-service, ipfs-cluster-ctl, ipfs-cluster-follow"
arch=('x86_64')
url=https://github.com/ipfs/ipfs-cluster
depends=('glibc')
license=('custom:MIT', 'APACHE')
source=("https://dist.ipfs.io/ipfs-cluster-service/v${pkgver}/ipfs-cluster-service_v${pkgver}_linux-amd64.tar.gz"
        "https://dist.ipfs.io/ipfs-cluster-ctl/v${pkgver}/ipfs-cluster-ctl_v${pkgver}_linux-amd64.tar.gz"
        "https://dist.ipfs.io/ipfs-cluster-follow/v${pkgver}/ipfs-cluster-follow_v${pkgver}_linux-amd64.tar.gz")
sha512sums=('b7581e91430777fd70a04d9d271b42cd4dd7460e96b8f789903fadbeb2ddd434c191887296c27233d51e6eea67bac30d488946544469725a96040f95ce6fe29a'
            '384012bc17aebd8854c1d7c65602f8ab8ee0feaeebcfdaf7af632770395e68506b7be4eb44c750d6b29bb16f5474510eba45cd61787f0862cc5310943665d326'
            '0fcf5fcd1e14a1124a8e39e3723d1cd0e862c3ea16d3e3b65b01ae80dbae5ca3943e274f0850825e28e157b7c8fcf308e0643293ab139576bbe6daabb5bea451')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
