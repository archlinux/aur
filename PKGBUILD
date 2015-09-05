# Maintainer: Ivan Petruk <localizator@ukr.net>

pkgname=gnome-shell-theme-super-flat-remix
_pkgname=Super-Flat-Remix-GNOME-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="Super Flat remix GNOME theme is a pretty simple shell theme, derived from Paper theme."
arch=('any')
url="http://gnome-look.org/content/show.php/Super+Flat+Remix+GNOME+theme?content=170094"
groups=('gnome-shell-extensions')
license=('GPL3')
depends=('gnome-shell')
source=('https://github.com/daniruiz/Super-Flat-Remix-GNOME-theme/archive/master.zip')
sha512sums=('bd9eafe4e411011c069ac7b0e6d20af4f7e0416ef639a9119d57eda2d684067de1485aab3d027f5cd08a5aac9394f4eef8da5c2d4d328374d0f41dc086665b7d')

package() {
    cd $srcdir
    
    mkdir -p ${pkgdir}/usr/share/themes/$_pkgname
    cp -r gnome-shell ${pkgdir}/usr/share/themes/$_pkgname/
    chmod -R 755 ${pkgdir}/usr/share/themes/$_pkgname
}