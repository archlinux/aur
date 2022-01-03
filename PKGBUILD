# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=notflix-git
pkgver=1.01.r0.g2eb7ba2
pkgrel=0
pkgdesc="Bugswriter's tool which search magnet links and streams one with webtorrent"
arch=(any)
license=('GPL3')
url='https://github.com/Bugswriter/notflix'
depends=('bash' 'grep' 'coreutils' 'libnotify' 'curl' 'sed' 'mpv' 'webtorrent-cli')
optdepends=('dmenu: menu system. Is actually required, but is optional because some people use dmenu without the package.')
source=("git+https://github.com/Bugswriter/notflix.git")
sha256sums=("SKIP")

package() {
	cd "$srcdir/notflix"
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
    cp preview.gif ${pkgdir}/usr/share/doc/${pkgname}/
    cp README.md ${pkgdir}/usr/share/doc/${pkgname}/
	mkdir -p ${pkgdir}/usr/bin/
	cp notflix ${pkgdir}/usr/bin/notflix
    chmod +x ${pkgdir}/usr/bin/notflix
}	
