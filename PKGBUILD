# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: wain <wain.at.archlinux.fr>

pkgname=customizepkg-scripting
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool to modify automatically PKGBUILDs - modified to just run scripts"
url="https://github.com/Scimmia22/customizepkg-scripting"
license=('GPL2')
arch=('any')
depends=('bash' 'diffutils')
optdepends=('vim: for vimdiff')
provides=('customizepkg')
conflicts=('customizepkg')
source=("https://github.com/Scimmia22/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d01a6e4dbc9643c74f7c1499f351c7ddf65bae0e9caa7d62cf41c9b30daa4291')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 customizepkg "$pkgdir/usr/bin/customizepkg" 
  install -Dm644 instructions "$pkgdir/etc/customizepkg.d/instructions" 
}

