pkgname=studioarch-utils
pkgver=1.2
pkgrel=1
pkgdesc="Studio Arch Utilities (Arch Linux)"
arch=('x86_64')
url="https://github.com/usrmusicman/ArchBuilds"
depends=('bash' 'bash-completion' 'nano' 'tar' 'xz' 'bzip2' 'gzip' 'attr' 'acl' 'util-linux' 'dosfstools' 'udftools' 'xfsprogs' 'jack2' 'pulseaudio-jack')
source=("https://github.com/usrmusicman/ArchStudioUtils/archive/$pkgver.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    
    ## Install Admin Panel
    install -Dm755 $srcdir/ArchStudioUtils-$pkgver/admin_panel_cli $pkgdir/usr/bin/admin_panel_cli
    
    ## Jack CLI tool
    install -Dm755 $srcdir/ArchStudioUtils-$pkgver/jackcli $pkgdir/usr/bin/jackcli
}
