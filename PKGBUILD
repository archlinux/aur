# Maintainer: Stefano Capitani <stefano@manjaro.org>
# Contributor: dady8889 <https://github.com/dady8889>

_pkgbase=gnome-shell-extension-desktop-icons
pkgname=$_pkgbase-reworked
pkgver=0.4
pkgrel=1
#_commit=7512f35108c2c462310bf9c7f8e4a4580c1ae748
_ext_dir=org.gnome.desktop-icons-reworked
pkgdesc="Add icons to the desktop"
arch=('any')
url="https://github.com/Ste74/$_ext_dir"
license=("LGPL3")
depends=('gnome-shell' 'gnome-shell-extensions')
conflicts=("$_pkgbase")
options=('!strip')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('ede5f3123e3a413ba8ddbaa2dda24df8934347cd61e8c992d4df2932ca26551f9aa7bb6238ca0752931409e06f7a4e5cf7433462be41005a0eaecb817dfd56ab')

package() {
	cd $_ext_dir-$pkgver
    make DESTDIR="${pkgdir}" INSTALL="system" install
}
