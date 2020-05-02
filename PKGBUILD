# Maintainer: Asem Arafa <asem.arafa at gmail dot com>

pkgname=amazon-workspacesclient
pkgver=3.0.6.444
pkgrel=1
pkgdesc='Amazon WorkSpaces Client'
arch=('x86_64')
license=('custom')
url='https://clients.amazonworkspaces.com/'
depends=('gtk3' 'webkit2gtk' 'libsoup')
options=('!strip' 'staticlibs')
source=('https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_amd64.deb')
sha512sums=('e3dd2523635d6d6e471eca79715994731dab76654467419f423392f8ed08fa9acf486c13860b7fe0dc165fe451299adc8274d38ec116991a2587b2fd105726ca')
package() {
	cd "$srcdir"
	tar axfv data.tar.xz -C "${pkgdir}"
}
