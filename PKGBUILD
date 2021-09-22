# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='Trustworthy encrypted command line authenticator app compatible with multiple backups.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/$pkgver/cotp-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('18caabad0aff478da21b0099f7cf701053a7b92d3e7156ca27f46d7900f64436')
conflicts=('cotp')
provides=('cotp')

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/usr/bin/cotp" "${pkgdir}/usr/bin/cotp"
}
