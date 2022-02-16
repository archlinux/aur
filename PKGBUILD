# Maintainer: @RubenKelevra
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>
pkgname=ipfs-cluster-bin
pkgver=0.14.5
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
b2sums=('3b3c45874f79e21e4b102534bc3a7868cc3806de1f61d79898dc6b1cc4865260e9b3f0019094c7f8f14ea348dc97da39f5cddc60a545bdd83fbe53bc8fb0b8b8'
        '9901e18bb11d7aebae573f52472b8142aacfc2048e7e1c5bb3e909978d4120b3cf87d6e19b09ecd8f5888b6831f2fcff878794755864c6127752304d94ed5db8'
        'ac1fe938158caecd771f62fdd79141cdaa382483e5c22d2e523aac1da230ae96062837d1f668c4f5cb297c5697d7435ddee39f1c382d866eaf17eb1cc811859d')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
