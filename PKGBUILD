# Maintainer: DnsAdBlock <office@dnsadblock.com>
pkgname=dnsadblock
pkgver=0.2.205
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


sha256sums=('902c9d67de7b07aa3a167daf5297ed6b1d7e75b460b7b9051b8870a8b23e93aa')
