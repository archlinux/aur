# Maintainer: Asem Arafa <asem.arafa at gmail dot com>

pkgname=amazon-workspacesclient
pkgver=3.0.8.529
pkgrel=1
pkgdesc='Amazon WorkSpaces Client'
arch=('x86_64')
license=('custom')
url='https://clients.amazonworkspaces.com/'
depends=('gtk3' 'webkit2gtk' 'libsoup')
options=('!strip' 'staticlibs')
source=('https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_amd64.deb')
sha512sums=('db09eda82ec74357cd5ab50c698a5ebbf500b33b6ed3150062eff7429ca93eef198eabbc0828f9add1b8423729874c8036f69b6ef3835980e1da6ccf021fc6ce')
package() {
	cd "$srcdir"
	tar axfv data.tar.xz -C "${pkgdir}"
}
