# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='mdsilo-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.5.5
pkgrel=1
pkgdesc='Local-first, lightweight personal wiki, RSS and podcast client (pre-compiled)'
arch=('x86_64')
url='https://mdsilo.com/'
_url='https://github.com/mdSilo/mdSilo-app'
license=('AGPL3')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'openssl'
  'webkit2gtk'
)
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
  '6fba1765bc02654a31f12058097d608c140d7047c73bac85b3bea55e7cbf656a'
)
sha512sums=(
  'dd78e1bb8a8f4554d16a898f7272921dfbcdb66bf42aab89aa09dac8cd8b64bd552dced39236feba7e4074096e6f6d560600e78d74474a043ed9bcaf43224e8b'
)
b2sums=(
  '668e3e094ddf259823e44f47ba534d29adf136fa2f41652d1ce620b1d8b0d5a5791d0711cd9a1fd60e1d761c13c9c588a7c1d74d51879d8e78c2e31925395bec'
)

# eof
