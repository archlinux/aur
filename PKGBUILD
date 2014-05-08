# Contributor: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=automounter
pkgver=0.1
pkgrel=2
pkgdesc="This is a link to gvfs-archive that will allow automounting of ISOs and other files, UBUNTU/FEDORA style"
url="https://bbs.archlinux.org/viewtopic.php?pid=606881"
depends=('gvfs')
license=('GPL')
arch=('any')
source=("mount-archive.desktop")
md5sums=('73890777b05aaa4e97c50e26c49cd7dc')

build() {
	mkdir -p $pkgdir/usr/share/applications/
	install $srcdir/mount-archive.desktop $pkgdir/usr/share/applications/
}

