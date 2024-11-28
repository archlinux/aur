# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>

pkgname=ipfs-cluster-bin
pkgver=1.1.2
pkgrel=1
epoch=1
changelog=changelog
pkgdesc="ipfs-cluster-service, ipfs-cluster-ctl, ipfs-cluster-follow"
arch=('x86_64')
url=https://github.com/ipfs/ipfs-cluster
depends=('glibc')
license=('MIT' 'APACHE')
source=("https://dist.ipfs.io/ipfs-cluster-service/v${pkgver}/ipfs-cluster-service_v${pkgver}_linux-amd64.tar.gz"
        "https://dist.ipfs.io/ipfs-cluster-ctl/v${pkgver}/ipfs-cluster-ctl_v${pkgver}_linux-amd64.tar.gz"
        "https://dist.ipfs.io/ipfs-cluster-follow/v${pkgver}/ipfs-cluster-follow_v${pkgver}_linux-amd64.tar.gz")
b2sums=('8aaacb7015525ec6fb6a4e38195c58dee7968d8605a1c57bcc7537c1702d08969955c9462bc8aa1dada54fab77fef9d5739cbd631293f3a4ae5b735675d0cde5'
        '914f4db7f801e2452652bf851f4d79b3d8caf859d20c6784f1992cbb2280b25a7347e5d20e6163e9fdb3b29ce8df154ed17d050d54d9c01d871a90b4e1815bf4'
        'c265e2e421f8da6d9b6988d1bbe29feb6c8bb2957bf3076a0372fc00a28624660aeb5385018b9d4d0f39ca46274e11296c2ea4387de4ea0e173dd462ad747af1')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
