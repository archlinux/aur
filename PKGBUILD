# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=jwm-session-git
_pkgname=jwm-session
pkgver=0.2
_pkgver=r02
pkgrel=2
pkgdesc="JWM XSession file, exec file and configuration files."
arch=('any')
url="https://github.com/BlackCodec/jwm-session/tree/master"
license=('GPL')
depends=('jwm')
optdepends=('jwmappmenugen-git: perl based menu generator' 
            'menugenerator: python based menu generator (default)')
source="https://github.com/BlackCodec/jwm-session/archive/$_pkgver.zip"
md5sums=('093cdf356bf601e8cbbe2c0d59cada8d')

package() {
   install -Dm 755 "$srcdir/$_pkgname-$_pkgver/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
   install -D "$srcdir/$_pkgname-$_pkgver/jwm.desktop" "$pkgdir/usr/share/xsessions/jwm.desktop"
   install -D "$srcdir/$_pkgname-$_pkgver/config/autostartrc" "$pkgdir/usr/share/jwm/autostartrc"
   install -D "$srcdir/$_pkgname-$_pkgver/config/grouprc" "$pkgdir/usr/share/jwm/grouprc"
   install -D "$srcdir/$_pkgname-$_pkgver/config/jwmrc" "$pkgdir/usr/share/jwm/jwmrc"
   install -D "$srcdir/$_pkgname-$_pkgver/config/keysrc" "$pkgdir/usr/share/jwm/keysrc"
   install -D "$srcdir/$_pkgname-$_pkgver/config/themerc" "$pkgdir/usr/share/jwm/themerc"
}
