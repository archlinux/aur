# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: wain <wain.at.archlinux.fr>

pkgname=customizepkg-scripting
_pkgname=customizepkg
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to modify automatically PKGBUILDs - modified to just run scripts"
url="https://github.com/Scimmia22/customizepkg-scripting"
license="GPL"
arch=('any')
depends=('bash' 'diffutils')
optdepends=('vim: for vimdiff')
provides=('customizepkg')
conflicts=('customizepkg')
source=("https://github.com/Scimmia22/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4bb8c7caef6b885d5edd605a04dcc81c88a7232c79cf1d379980bae58fc9401c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 customizepkg "$pkgdir/usr/bin/customizepkg" 
  install -Dm644 instructions "$pkgdir/etc/customizepkg.d/instructions" 
}

