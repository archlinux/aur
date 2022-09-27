# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>

pkgname=ipfs-cluster-bin
pkgver=1.0.4
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
b2sums=('bf566240d401ad049e6fe38fa305bc6f81ee84d48a119ee1b8a759eedc2a5eb557101a1ada1da486a0f2e36a6d0f66473a7285ac80b5e1f9cd7bed075bd26a6a'
        'ded2c5cfcc5ddbbc05ce5871f2a810aee4d2181a8a2895f751e5073a260d5e93a94d15c788774eeb241d7afdcf3b92d586b2308fa4e6a34502e7d59e88cd30c8'
        '8710e47eb6737b22fad1fba5c3e1395a9bdeb3a115516da2ea46e293419705a0066dba97415052bd04c3d7bad8d3293ed556869a0e841d299e4da49bc4b85fdb')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
