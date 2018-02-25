# Maintainer: levinit <levinit@outlook.com>

pkgname=gnome-shell-extension-mconnect
releasesname=mconnect.andyholmes.github.io
shellname=mconnect@andyholmes.github.io
pkgver=15
pkgrel=1
pkgdesc='KDE Connect/MConnect integration for Gnome Shell'
arch=(any)
url='https://github.com/andyholmes/gnome-shell-extension-mconnect'
license=('GPL2')
depends=('gnome-shell' 'mconnect-git')
optdepends=('gnome-tweak-tool')
install=$pkgname.install

source=('https://github.com/andyholmes/gnome-shell-extension-mconnect/releases/download/v17/mconnect.andyholmes.github.io.zip')
md5sums=('SKIP')

package() {
    rm $srcdir/$releasesname.zip
    install -dm755 $pkgdir/usr/share/gnome-shell/extensions/$shellname
    cp -rf $srcdir/* $pkgdir/usr/share/gnome-shell/extensions/$shellname
}
