# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>

pkgname=xcursor-breeze-serie-obsidian
pkgver=2.0
pkgrel=1
pkgdesc="Breeze Serie Obsidian cursor theme, right handed."
arch=('any')
url="https://www.gnome-look.org/p/999991/"
license=('GPL')
depends=('libxcursor')
source=("https://www.dropbox.com/s/uow6jkhlzb20cb6/Breeze-Obsidian.tgz")
md5sums=('8ccb57fb9851d0149126d5a676e92fca')

package() {
    mkdir -p ${pkgdir}/usr/share/icons
    cp -R ${srcdir}/Breeze-Obsidian ${pkgdir}/usr/share/icons/
}

# vim:set ts=4 sw=4 et:
