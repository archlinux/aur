# Maintainer: éclairevoyant
# Contributor: Dave Brown <d dot brown at bigdavedev dot com>
# Contributor: theblazehen <com dot theblazehen at post - reverse>

pkgname=xinit-xsession
pkgver=1
pkgrel=4
pkgdesc="Allows ~/.xinitrc to be run as a session from your display manager"
arch=('any')
license=("GPL3")
provides=('xinit-xsession')
depends=('bash')
source=('xinitrcsession-helper' 'xinitrc.desktop')
sha1sums=('0b3ee35032ba0cef758d61154c1bfbb858b8827c'
          '9665e18bd24aca0afd9d46d3c9200893fd12a391')

package() {
	install -Dm755 xinitrcsession-helper -t "$pkgdir/usr/bin/"
	install -Dm644 xinitrc.desktop -t "$pkgdir/usr/share/xsessions/"
}
