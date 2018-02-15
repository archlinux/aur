# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: Federico Damián <federicodamians@gmail.com>

pkgname=vimix-icon-theme
pkgdesc="Fresh and simple personality icon theme."
pkgver=1.3
pkgrel=1
arch=('any')
url="https://vinceliuice.deviantart.com/art/Vimix-icon-themes-530683384"
license=('custom:CC-BY-SA-4.0')
source=("https://github.com/vinceliuice/${pkgname}/archive/${pkgname}_${pkgver}.tar.gz")
sha256sums=('91283632c7d2181dc19b2ea7b28b5b71b6ba5979f7a516b5dc1495165889dbf8')

package() {
  install -d -m 755 "$pkgdir"/usr/share/icons/vimix
  install -d -m 755 "$pkgdir"/usr/share/icons/paper-vimix

  cd $srcdir/${pkgname}-${pkgname}_${pkgver}
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd $srcdir/${pkgname}-${pkgname}_${pkgver}/Vimix
  cp -r . "$pkgdir"/usr/share/icons/vimix/
  cd $srcdir/${pkgname}-${pkgname}_${pkgver}/Paper-Vimix
  cp -r . "$pkgdir"/usr/share/icons/paper-vimix/
}

# vim: ft=sh ts=2 sw=2 et:
