# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>

pkgname=ipfs-cluster-bin
pkgver=1.0.6
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
b2sums=('ba73bc1e8be8fcd9ac62ded8daa085437660dc56361e9cbe3137c8b469d65ddc35279f4898e844d0a7867e65a32ffcc56a340c4e832db2012a5cb36e9f3c26e1'
        '6083c73be801ae607f1f8f2f6ff775a2d59b219f3b25410a1cb42f6d4d30cd568e413ff02e5d26a478cdfa4e540f7e3509933c047267cc662089d8f252e13deb'
        'f20170f40c3e8272e1257270ec7b72e99fae8031a9a337b0847db518ceeb23b8c8021df5c90eff0d8ac894a42ca943016d106b459c901b9070c0ccb1f894e9f9')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
