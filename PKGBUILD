pkgname=ttf-inconsolata-lgc-for-powerline
pkgver=1.0
pkgrel=1
pkgdesc="Inconosalata LGC for Powerline"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=('git+https://github.com/Gonzih/inconsolata-lgc-for-powerline.git')
install=$pkgname.install
md5sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/inconsolata-lgc-for-powerline/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}

