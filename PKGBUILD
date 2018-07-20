# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=automounter
pkgver=0.1
pkgrel=5
pkgdesc="This is a link to gvfs-archive that will allow automounting of ISOs and other files, UBUNTU/FEDORA style"
url="https://bbs.archlinux.org/viewtopic.php?pid=606881"
depends=('gvfs' 'desktop-file-utils')
license=('GPL')
arch=('any')
source=("mount-archive.desktop")
md5sums=('a73c57514b3d055d4fec90ee20aa8efc')

package() {
	mkdir -p $pkgdir/usr/share/applications/
	install $srcdir/mount-archive.desktop $pkgdir/usr/share/applications/
}

