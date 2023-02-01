# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='mdsilo-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.5.3
pkgrel=2
pkgdesc='Local-first, lightweight personal wiki, RSS and podcast client (pre-compiled)'
arch=('x86_64')
url='https://mdsilo.com/'
_url='https://github.com/danloh/mdSilo-app'
license=('AGPL3')
depends=('webkit2gtk')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$_url/releases/download/app-v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
)

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
  chown -R root:root "$pkgdir/usr"
}

sha256sums=(
  'ab8bc4ee0162d497bf1d82a4b0baab5b1fb203ec789ba7569d2106696a1500bc'
)
sha512sums=(
  'c370ec0ffd988c98aad452db3aee7b75449721c8c70503100829ac8fb04f5d6bbfcd038d578a22d7c36819c232ae252fbe9aab55b847de6207d07162c3f4eb31'
)
b2sums=(
  'ac98fe5393d716f78a53bc1535fc455c59273f9b3053936db527fc0f0b26de34c919ab13ea9f18fd46a8fda87deec1d9b400d808351d2155ead38245dcbc6111'
)

# eof
