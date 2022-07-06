# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>

pkgname=ipfs-cluster-bin
pkgver=1.0.2
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
b2sums=('026c399a2943535530f0f8b8a73d2e508c92ae338e0e8492afc446841d90e77b852ec22af598248a2eba77cfd7d11efc5aa19bef0081e74849606fffc3b5079a'
        '47ee783530958eaa47d9bedfe04bd21e203119f26872c33c9467dd31791c1574fc5b3910ff555e0c8230c9804553c0eec51eca6fc21af0c9eea7a0823fda1dc8'
        '8b738bcd421141038829bdeee98ef8e8bde9c71827ace762dfb47dc75f1e0c41ac34acde9d35a35241be4484fbb8e0870ffe549da18eedbc9684bd608ef759b2')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
