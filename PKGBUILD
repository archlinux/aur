# Maintainer: Ivan Petruk <localizator@ukr.net>

pkgname=gnome-shell-theme-super-flat-remix
_pkgname=Super-Flat-Remix-GNOME-theme
pkgver=1.0.2
pkgrel=1
pkgdesc="Super Flat remix GNOME theme is a pretty simple shell theme, derived from Paper theme."
arch=('any')
url="http://gnome-look.org/content/show.php/Super+Flat+Remix+GNOME+theme?content=170094"
groups=('gnome-shell-extensions')
license=('custom:cc-by-nc-sa-3.0')
depends=('gnome-shell')
source=("https://github.com/daniruiz/${_pkgname}/archive/master.zip")
sha512sums=('bd9eafe4e411011c069ac7b0e6d20af4f7e0416ef639a9119d57eda2d684067de1485aab3d027f5cd08a5aac9394f4eef8da5c2d4d328374d0f41dc086665b7d')

package() {
    cd "${srcdir}/$_pkgname-master/"
    install -dm755 "${pkgdir}/usr/share/themes"
    rm -f "Super Flat Remix GNOME theme"/{CREDITS,README.md}
    cp -a "Super Flat Remix GNOME theme" "${pkgdir}/usr/share/themes/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}