# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>

pkgname=ipfs-cluster-bin
pkgver=1.1.6
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
b2sums=('f7fa61c2472218717ba672a6235c17703eb35f1e1e61899c519707a28dfcbcecfbcb5ed044469f4db202672374fc67cf492020a91d56c3413836c30e65d187c2'
        '9483f70f71913fec3407667f79dd367a3c87158f71fbd7fc3ba61ff8345c648eed22dde2c7d907efe89a8b8e7e00b4dd98696562d5ed0363bfd931d690c9155c'
        'a76159865d4fdf7f2806da47817ff2017c259c7f6f068f6df5e32a47cbb1f55834cac9e63c5c993ac162294dd54e53da6831107cdde53a844cf8b14e8c50caba')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
