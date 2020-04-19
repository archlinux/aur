# Maintainer: DnsAdBlock <office@dnsadblock.com>
pkgname=dnsadblock
pkgver=0.2.50
pkgrel=1
pkgdesc='DnsAdBlock DNS to DOH proxy client'
arch=('x86_64')
url='https://github.com/dnsadblock/proxy-release'
license=('MIT')
source=("$url/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('@checksum@')
install=$pkgname.install

package() {
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}


sha256sums=('ccf0dc688cc2da1b411a607cd504dd43a27861bf4af01a9da9a8fd9bcb0f0ec1')
