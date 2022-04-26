# Maintainer: @RubenKelevra
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>
pkgname=ipfs-cluster-bin
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="ipfs-cluster-service, ipfs-cluster-ctl, ipfs-cluster-follow"
arch=('x86_64')
url=https://github.com/ipfs/ipfs-cluster
depends=('glibc')
license=('MIT' 'APACHE')
source=("https://dist.ipfs.io/ipfs-cluster-service/v${pkgver}/ipfs-cluster-service_v${pkgver}_linux-amd64.tar.gz"
        "https://dist.ipfs.io/ipfs-cluster-ctl/v${pkgver}/ipfs-cluster-ctl_v${pkgver}_linux-amd64.tar.gz"
        "https://dist.ipfs.io/ipfs-cluster-follow/v${pkgver}/ipfs-cluster-follow_v${pkgver}_linux-amd64.tar.gz")
b2sums=('81fd8379bd3d9acbd1a66d607974a56ffbdedeb769397f02cd8d35d7c7cfeefdebebbad5ab7790963513d84dead773e5dd5da289941dbc94abd107aa31b9e859'
        '4c9cc9a5696d41db17c4e07ceb9bea04ffd00f00d99337e22e2879f29a368a650d8f66474ad29a3831f36b41104b2e23b8c7f7d35f5d9a591f1cdd8b6fb73f8a'
        'a42daebfe01f57e8112782d460e07aa6d23109a323dfb7dcdb894d7568bf6cdc70787c3a945366652572b63ace2a397d2dfed374fa962baae6cbfbdcdfd507a4')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
