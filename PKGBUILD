pkgname=system-config-nfs
pkgdesc="A tool that lets you change the NFS server settings as well as manage the directories you want to share per NFS from your computer."
pkgver=1.4.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://fedoraproject.org/wiki/SystemConfig/nfs"
license=('GPL')
source=(system-config-nfs-1.4.3-1.fc23.noarch.rpm)
md5sums=('SKIP')
depends=('python-gtkspellcheck' 'python-gobject')

package() {
	cp -r $srcdir/* ${pkgdir}
}