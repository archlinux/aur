# Maintainer: DnsAdBlock <office@dnsadblock.com>
pkgname=dnsadblock
pkgver=0.2.40
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


sha256sums=('4faf6408a931cdcfdaa54ec76437e26ec8b63bf826f3bcfa85226bf370b5b2f6')
