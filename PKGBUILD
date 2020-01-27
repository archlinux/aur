pkgname=studioarch-utils
pkgver=2.5
pkgrel=1
pkgdesc="Studio Arch Utilities (Arch Linux)"
arch=('x86_64')
url="https://github.com/usrmusicman/ArchBuilds"
depends=('bash' 'bash-completion' 'tar' 'xz' 'bzip2' 'gzip' 'jack2' 'python2-dbus' 'pulseaudio-jack' 'a2jmidid')
source=("$pkgname::git+https://github.com/usrmusicman/ArchStudioUtils.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    
    ## Install Backup Restore Utility
    install -Dm755 $srcdir/$pkgname/backup_restore $pkgdir/usr/bin/backup_restore
    
    ## Jack CLI tool
    install -Dm755 $srcdir/$pkgname/jackcli $pkgdir/usr/bin/jackcli
}
