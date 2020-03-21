# Maintainer: Asem Arafa <asem.arafa at gmail dot com>

pkgname=amazon-workspacesclient
pkgver=3.0.4.321
pkgrel=1
pkgdesc='Amazon WorkSpaces Client'
arch=('x86_64')
license=('custom')
url='https://clients.amazonworkspaces.com/'
depends=('gtk3' 'webkit2gtk' 'libsoup')
options=('!strip' 'staticlibs')
source=('https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_amd64.deb')
sha512sums=('4bb30327c7cd13739c9c715746e4da22f3dd28060e8c2658d955de0d362130569aede02ac966d37d891ca1b07e6e68532d1903caba1d4d1ef03610804345c6d3')
package() {
	cd "$srcdir"
	tar axfv data.tar.xz -C "${pkgdir}"
}
