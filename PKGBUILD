pkgname=studioarch-utils
pkgver=2.3
pkgrel=1
pkgdesc="Studio Arch Utilities (Arch Linux)"
arch=('x86_64')
url="https://github.com/usrmusicman/ArchBuilds"
depends=('bash' 'bash-completion' 'tar' 'xz' 'bzip2' 'gzip' 'jack2' 'python2-dbus' 'pulseaudio-jack')
source=("https://github.com/usrmusicman/ArchStudioUtils/archive/$pkgver.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    
    ## Install Backup Restore Utility
    install -Dm755 $srcdir/ArchStudioUtils-$pkgver/backup_restore $pkgdir/usr/bin/backup_restore
    
    ## Jack CLI tool
    install -Dm755 $srcdir/ArchStudioUtils-$pkgver/jackcli $pkgdir/usr/bin/jackcli
}
