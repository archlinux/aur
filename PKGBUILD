pkgname=ttf-consolas-powerline
pkgver='1.0.g3cd9d75'
pkgrel=1
pkgdesc="Consolas for Powerline"
arch=(any)
depends=(fontconfig xorg-font-utils)
fontname='consolas-powerline'
_pkgbase="$fontname-vim"
source=("git+https://github.com/eugeii/$_pkgbase")
md5sums=('SKIP')
install=$pkgname.install

package() {
	install -Dm644 $srcdir/$_pkgbase/CONSOLA-Powerline.ttf "$pkgdir"/usr/share/fonts/$fontname/CONSOLA-Powerline.ttf
	install -Dm644 $srcdir/$_pkgbase/CONSOLAB-Powerline.ttf "$pkgdir"/usr/share/fonts/$fontname/CONSOLAB-Powerline.ttf
	install -Dm644 $srcdir/$_pkgbase/CONSOLAI-Powerline.ttf "$pkgdir"/usr/share/fonts/$fontname/CONSOLAI-Powerline.ttf
	install -Dm644 $srcdir/$_pkgbase/CONSOLAZ-Powerline.ttf "$pkgdir"/usr/share/fonts/$fontname/CONSOLAZ-Powerline.ttf
}
