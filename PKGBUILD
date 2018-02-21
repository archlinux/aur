# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: wain <wain.at.archlinux.fr>

pkgname=customizepkg-scripting
pkgver=0.4.1
pkgrel=2
pkgdesc="A tool to modify automatically PKGBUILDs - modified to just run scripts"
url="https://github.com/Scimmia22/customizepkg-scripting"
license=('GPL2')
arch=('any')
depends=('bash' 'diffutils' 'coreutils' 'grep')
optdepends=('vim: for vimdiff')
provides=('customizepkg')
conflicts=('customizepkg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Scimmia22/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c9968f443395f4716a2fe42eb4ff1d379d3a81e04c149bf02c6ac2b50cfe61f8')

package() {
  cd $pkgname-$pkgver

  install -Dm755 customizepkg -t "$pkgdir/usr/bin/"
  install -Dm644 instructions -t "$pkgdir/etc/customizepkg.d/"
}

