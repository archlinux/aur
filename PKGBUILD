# Maintainer: @RubenKelevra
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>
pkgname=ipfs-cluster-bin
pkgver=0.14.4
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
b2sums=('4a96ce06b938d8dc349227e1959c6cace380ec85a5bd159ac5413b8d3b3f9572bf5648f0bc03d3e8fbe6e86158c95e2047ea808e4d95e22067babe7a1a2b6466'
        '10995646ac3f2d3d1f619f2c67bfad2f14c098459fd66ea2d8007b7aaac08421743a0d922ea11f640f78934e71e33654b6c98db8afcc0727df0c2e2128d7439d'
        '6a54ade81dff08e41c504d7946de75da7403af8453de106e7b87fe1b913b9017231c6b1ee53fc1cce80d36ddaa4fb6b8cafc87e799d8a192a0dcb45adcef5b69')

package() {
	install -Dm755 ipfs-cluster-service/ipfs-cluster-service "$pkgdir/usr/bin/ipfs-cluster-service"
	install -Dm755 ipfs-cluster-ctl/ipfs-cluster-ctl "$pkgdir/usr/bin/ipfs-cluster-ctl"
	install -Dm755 ipfs-cluster-follow/ipfs-cluster-follow "$pkgdir/usr/bin/ipfs-cluster-follow"
	install -Dm644 ipfs-cluster-ctl/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
