# Maintainer: codeDude <codeDude@disroot.org>
pkgname="passwofi"
pkgver=0.0.1
pkgrel=1
pkgdesc="Script to list and select the password of pass in wofi inspired in dmenu passmenu."
arch=('any')
url="https://codeberg.org/codeDude/passwofi"
license=('GPL-3.0-only')
depends=('pass' 'wofi' 'bash')
provides=('passwofi')
conflicts=('passwofi')
changelog=
source=("${pkgname}${pkgver}.tar.gz::https://codeberg.org/codeDude/passwofi/archive/v0.0.1.tar.gz")
sha256sums=('86bbf1ef16d903bbdd2ea3b20bf281fa88330f2e4ba89e762e03919527e94402')

package() {
	cd "$srcdir"
  install -Dm0755 "$srcdir/$pkgname/passwofi" "$pkgdir/usr/bin/passwofi"
}
