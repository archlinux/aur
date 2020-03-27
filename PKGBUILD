# Maintainer: DnsAdBlock <office@dnsadblock.com>
pkgname=dnsadblock
pkgver=0.2.42
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


sha256sums=('4476d1957004bff3bcd60aa73c26eebd595b6d8f7af2c2adb76be640029467e7')
