# Maintainer: Oleg Reich <root (at) archlinux (dot) guru>

pkgname=slim-sexy
pkgver=0.2
pkgrel=1
pkgdesc="Theme's Pack for SLiM (Simple Login Manager)"
arch=('any')
url="https://github.com/FollowMeDown/slim-sexy"
license=('ISC')
optdepends=('slim: Slimple Login Manager')
source=("${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig")
sha256sums=('33ed0b43cc474d0bbde9caced66c05e7e6550ac4695c1b474058ae2798dd3afe'
            'SKIP')
validpgpkeys=(A61D4D9711403C840E86AEE0A754BB4BA18DE375) # Oleg Reich

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/slim/themes"
  cp -r themes/* "$pkgdir"/usr/share/slim/themes
}

# vim:set ts=2 sw=2 et:
