# Maintainer: robespierre <guillotine114514@outlook.com>

pkgname=yad-zenity
pkgver=114514.1919.810
pkgrel=2
pkgdesc="Replace zenity with yad.Use at own risk"
arch=('any')
url="https://aur.archlinux.org/packages/yad-zenity"
license=('GPL3')

conflicts=('zenity')
provides=('zenity')
replaces=('zenity')

depends=('yad')
license=('GPL3')

package()
{
    mkdir -p $pkgdir/usr/bin
    ln -s /usr/bin/yad $pkgdir/usr/bin/zenity
}
