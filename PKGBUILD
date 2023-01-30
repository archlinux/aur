# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>

pkgname=ipfs-cluster-bin
pkgver=1.0.5
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
b2sums=('2f52a9b6b53080d81ae85c5ee9b50e5c711927ed362faa73b2283c9638bb51c649936a610432c91ec8f904ae18c433e856f34ebab007604b895729d77bfe9ec3'
        '2be19807575e1f3ac80d763e44c39cca8663c7b476c0093e58ef3a09b046c51b57e9d80f4b02f45880c3d37b4ef0de17ce1076646cd5d4d2de14f766f06f514d'
        'a59ece48b4480a5a61b76c6e653ba898e6a64282e40fc09443e1d351564f4f01851d24bd3cddae71ec896d1f6b25c68af009c2bd3e01620fb850a4afd152d443')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
