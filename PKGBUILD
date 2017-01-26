# Maintainer: Matthias Loibl <mail at matthiasloibl dot com>

pkgname=gopass
pkgver=1.0.0
pkgrel=1
pkgdesc="The team password manager. Written in Go."
arch=('x86_64')
url="https://github.com/justwatchcom/gopass"
license=('MIT')
depends=('xclip' 'bash' 'gnupg' 'pwgen')
provides=("gopass=${pkgver}-rc2")
source_x86_64=("gopass-${pkgver}-rc2-1-x86_64.pkg.tar.xz::https://www.moviecycle.com/gopass/releases/${pkgver}-rc2/gopass-${pkgver}-rc2-1-x86_64.pkg.tar.xz")
md5sums_x86_64=('4db30794ee65f204599a7e30bb880f29')
sha256sums_x86_64=('5825e8a608d9e94fe5315c60751964f80bd42dfc5ea5b21509ede32aeb78c3da')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/gopass "$pkgdir"/usr/bin/gopass
}
