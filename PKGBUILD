pkgname=system-config-nfs
pkgdesc="A tool that lets you change the NFS server settings as well as manage the directories you want to share per NFS from your computer."
pkgver=1.4.3
pkgrel=2
arch=('i686' 'x86_64')
url="https://fedoraproject.org/wiki/SystemConfig/nfs"
license=('GPL')
source=("system-config-nfs-1.4.3-1.fc23.noarch.rpm"
	"system-config-nfs")
md5sums=('8117766558a723f077c395a1e0a016cc'
	'10cebcb296f60d885f596db5dcbe6104')
depends=('python2')

package() {
	rm $srcdir/usr/bin/system-config-nfs
	mv system-config-nfs $srcdir/usr/bin/
	cp -r $srcdir/* ${pkgdir}
}