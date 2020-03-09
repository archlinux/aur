# Maintainer: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>
pkgname=ipfs-cluster-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="ipfs-cluster-service, ipfs-cluster-ctl, ipfs-cluster-follow"
arch=('x86_64')
url=https://github.com/ipfs/ipfs-cluster
depends=('glibc')
license=('custom:MIT', 'APACHE')
source=("https://dist.ipfs.io/ipfs-cluster-service/v${pkgver}/ipfs-cluster-service_v${pkgver}_linux-amd64.tar.gz"
        "https://dist.ipfs.io/ipfs-cluster-ctl/v${pkgver}/ipfs-cluster-ctl_v${pkgver}_linux-amd64.tar.gz"
        "https://dist.ipfs.io/ipfs-cluster-follow/v${pkgver}/ipfs-cluster-follow_v${pkgver}_linux-amd64.tar.gz")
sha512sums=('5a76168187143065b66f9dd967608bfb7203547a0ea69ac4ef523cb7ff2a76f691cd9267e230c949d6975e8fea76a704f4464b2a96b6f91d89cca3fd18696882'
            'ef9f48e32bb64bc8c7d0042d559539792eda361ccea02e633d6c2751a73da5f26b2f0edcb7d09c015e6e24e8f6580dea739d29a65c7a237d59b6b1554bb24b6f'
            '78cb6a890760a78d30e0756707c67b349b3b47b21f0774eabcd489e65c2eca8b8dbfb9096d9512ecc4ebc281e8d6d3c847aef40352b180dced8209f5bebdd012')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
