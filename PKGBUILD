# Maintainer: DnsAdBlock <office@dnsadblock.com>
pkgname=dnsadblock
pkgver=0.2.206
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


sha256sums=('5506710ededfd5c7c7afefb631e4585c863466dddbe3acdc5c5a28db34e4a423')
