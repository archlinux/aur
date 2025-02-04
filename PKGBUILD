# Maintainer: robertfoster

pkgname=bootinfoscript
pkgver=0.78 # renovate: datasource=github-tags depName=arvidjaar/bootinfoscript
pkgrel=1
pkgdesc="A script which searches all hard drives attached to the computer for information related to booting."
arch=('i686' 'x86_64')
url="https://github.com/arvidjaar/bootinfoscript"
license=('MIT')
depends=('bash')
source=("https://github.com/arvidjaar/bootinfoscript/archive/v$pkgver.tar.gz")

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m644 bootinfoscript $pkgdir/usr/bin/bootinfoscript
  chmod +x $pkgdir/usr/bin/bootinfoscript
}

sha256sums=('19780542c78756cee5eaf2327e118472d8d509df93bc7bf60deefa7db5ada80d')
