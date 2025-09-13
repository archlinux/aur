pkgname=kvantum-theme-arcdarker-git
pkgver=r2.acb92e8
pkgrel=1
pkgdesc="Arc Darker for Kvantum"
arch=(any)
url=https://github.com/maggster165/Kvantum-Arc-Darker
source=("git+$url.git")
depends=('kvantum')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/Kvantum-Arc-Darker"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "$srcdir/Kvantum-Arc-Darker/"
  install -d "$pkgdir/usr/share/color-schemes/" "$pkgdir/usr/share/Kvantum"
  cp -r colors/KvArcDarker.colors "$pkgdir/usr/share/color-schemes/"
  cp -r kvthemes/KvArcDarker "$pkgdir/usr/share/Kvantum"
  }
  
