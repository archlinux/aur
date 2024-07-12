# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>

pkgname=ipfs-cluster-bin
pkgver=1.1.1
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
b2sums=('5546d26cc6b95d22e1cd926e6e6333b8000ea1a549ecf04cb26565e1f00a59a4083811ee863413a3e210e1672170522d225a5d36e3e4089244afc07a1c643206'
        '8ed28398c9fe9b4ec5f7722f7554869ff3fb8653aaf7a4d810f719e8a2c4359afd74fbff5e4596b1980b2dad4d938306cedbe89123cdd770f6419eb1d8b462a0'
        '579f11163efb55d4b39bf64028d13178d13a0d87380423aa032055a6792538f37785543dae811d4c03b75eb0169c906ce2a1e75d8a43a0aeefc09624ee802265')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
