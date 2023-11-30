# Maintainer: Gary Streck <gstreck at comcast dot net>

pkgname=smbbrowse
pkgver=1.1
pkgrel=0
pkgdesc="Samba share browser and mounter written in Python. Supports SMBv2 and SMBv3"
arch=(any)
url="https://github.com/cyberjunkie1970/smbbrowse"
license=('MIT')
depends=('smbclient' 'gvfs-smb' 'python' 'python-pillow' 'tk' 'xdg-utils' 'sshfs')
makedepends=('git')
provides=('SMBbrowse.py')
source=("git+https://github.com/cyberjunkie1970/${pkgname}.git")
md5sums=('SKIP')
 
package() {
    cd "$pkgname"
    install -Dm755 SMBbrowse.py "$pkgdir/usr/bin/SMBbrowse.py"
    install -Dm644 serverIcon.png "$pkgdir/usr/share/pixmaps/$pkgname/serverIcon.png"
    install -Dm644 folderIcon.png "$pkgdir/usr/share/pixmaps/$pkgname/folderIcon.png"
    install -Dm644 SMBbrowse.desktop "$pkgdir/usr/share/applications/SMBbrowse.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
