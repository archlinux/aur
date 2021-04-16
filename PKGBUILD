# Maintainer: Aeryxium <aeryxium+aur@gmail.com>
pkgname='tgr'
pkgver=1
pkgrel=1
pkgdesc='Refresh gpg keys periodically and privately over tor circuits.'
arch=('any')
url='https://github.com/aeryxium/tgr'
license=('MIT')
source=("tgr" "tgr.service" "LICENSE" )
md5sums=('ddf08c1bbee5581b5372403515fbf397'
         'f7e2c455294e5bccfb9ee7f60afa848c'
         '2d49e1137e0abcc0c0071cd88ba0835c')
depends=( 'tor' 'torsocks' )
package() {
	install -Dm0755 "$srcdir/tgr" "$pkgdir/usr/bin/tgr"
	install -Dm0644 "$srcdir/tgr.service" "$pkgdir/usr/lib/systemd/user/tgr.service"
	install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
