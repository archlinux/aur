# Maintainer: Asem Arafa <asem.arafa at gmail dot com>

pkgname=amazon-workspacesclient
pkgver=3.0.1.234
pkgrel=1
pkgdesc='Amazon WorkSpaces Client'
arch=('x86_64')
license=('custom')
url='https://clients.amazonworkspaces.com/'
depends=('gtk3' 'webkit2gtk' 'libsoup')
options=('!strip' 'staticlibs')
source=('https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_amd64.deb')
sha512sums=('8be0c5420608d338af9646a870ba89a158b2fc96eb3407ad47cc1999c87395d29ec1b55fe559599f0ec2c3aab169ab84e256e8f6aad9dadd6fae1825f00ad07e')
package() {
	cd "$srcdir"
	tar axfv data.tar.xz -C "${pkgdir}"
}
