# Maintainer: DnsAdBlock <office@dnsadblock.com>
pkgname=dnsadblock
pkgver=0.2.36
pkgrel=1
pkgdesc='DnsAdBlock DNS to DOH proxy client'
arch=('x86_64')
url='https://github.com/dnsadblock/proxy-release'
license=('MIT')
source=("$url/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('@checksum@')
install=$pkgname.install

package() {
	cd $pkgname-$pkgver
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

sha256sums=('d822ae5c0b6c4e3d290afae7fde7bece2d2d18e30157e02384fcc2e7e736d755')