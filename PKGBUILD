# Maintainer: éclairevoyant
# Contributor: Dave Brown <d dot brown at bigdavedev dot com>
# Contributor: theblazehen <com dot theblazehen at post - reverse>

pkgname=xinit-xsession
pkgver=1
pkgrel=5
pkgdesc="Allows ~/.xinitrc to be run as a session from your display manager"
arch=('any')
license=('GPL3')
provides=('xinit-xsession')
depends=('coreutils' 'sh')
source=('xinitrcsession-helper' 'xinitrc.desktop')
b2sums=('f90a2d7142e70a1be7d4ea1d3e8459539db4db1f45b594b4263381ee7cfb69759f9763759a61b0a3f40ae4b7356c22740ea23cfa25ed264c4146d91b2aea4f9c'
        '8d0e8bb182ec5d5d4b0c0238645de74a2a0896ce9e6af646eb8503cddd23400053fdf96fde895c8adbd9811cc99f1b842311017373b7659004161f51feca754f')

package() {
	install -Dm755 xinitrcsession-helper -t "$pkgdir/usr/bin/"
	install -Dm644 xinitrc.desktop -t "$pkgdir/usr/share/xsessions/"
}
