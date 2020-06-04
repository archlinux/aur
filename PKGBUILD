# Maintainer: Asem Arafa <asem.arafa at gmail dot com>

pkgname=amazon-workspacesclient
pkgver=3.0.7.470
pkgrel=1
pkgdesc='Amazon WorkSpaces Client'
arch=('x86_64')
license=('custom')
url='https://clients.amazonworkspaces.com/'
depends=('gtk3' 'webkit2gtk' 'libsoup')
options=('!strip' 'staticlibs')
source=('https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_amd64.deb')
sha512sums=('ce0c6b10f89f197620fe3ac88f4085da518064363cbd015fe7a5eceef217699552d3024b599fcf87f2ef9b7b3da907e66134fed633e335964d36813d490fd695')
package() {
	cd "$srcdir"
	tar axfv data.tar.xz -C "${pkgdir}"
}
