 
# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-obsidian-cursor-theme
pkgver=1.0
pkgrel=2
pkgdesc="Breeze Obsidian cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://share.kde.org/public.php?service=files&t=6524eea49b2f0f30be31e98e9fe6b731&download")
makedepends=('unzip')

sha256sums=('2f8b9f8dd1bbf3e8ea6d5ab649d59ec7a0136658b2fd3368a87958c6975d48cb')

package() {
    cd $srcdir/Breeze_Obsidian
    install -d $pkgdir/usr/share/icons/Breeze_Obsidian
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Obsidian
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Obsidian/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Obsidian
    chmod 755 $pkgdir/usr/share/icons/Breeze_Obsidian/cursors
}
