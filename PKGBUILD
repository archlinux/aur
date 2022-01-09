# Maintainer: @RubenKelevra
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>
pkgname=ipfs-cluster-bin
pkgver=0.14.3
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
b2sums=('237447c5a7147e7663609259ef5f35e11443de414e8841ff4f8cd9d75c16965473ece8c625d27abfbdd0f6e9424c0857f11540cf9e5fad1f6ee7ca7351735dc4'
        'fcfebeae5f5a3d11286d73b8239b5861c7f5e60f67b6bc583ea82ea880e42be1ee52a1408a9b30245749b369047643789accf934cafbe74dd64d2daa8180116a'
        'e423e86c295eec339606dfc645de9b799f26b3d5ba0ac2c4506efae4d133f60eef14dcb12d0d0e46b821f6e7d1689e99f3daa3beb80d9226484a641107f9c052')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
