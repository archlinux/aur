# Maintainer: <development[at]kondorgulasch[dot]de>

pkgname=pidgin-xmpp-receipts
pkgver=0.6
pkgrel=1
pkgdesc="This pidgin-plugin implements xmpp message delivery receipts (XEP-0184)"
url="http://devel.kondorgulasch.de/pidgin-xmpp-receipts/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('pidgin' 'libpurple')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=('http://devel.kondorgulasch.de/pidgin-xmpp-receipts/files/pidgin-xmpp-receipts-0.6.tar.gz');
md5sums=('820e06e823b01caf452b2500aecdc246')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/pidgin"
  cp xmpp-receipts.so "${pkgdir}/usr/lib/pidgin"
}
