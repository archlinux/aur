pkgname=cajviewer
pkgver=7.2
pkgrel=2
pkgdesc="Document Viewer for TEB, CAJ, NH, KDH and PDF format"
arch=(x86_64)
url="http://cajviewer.cnki.net/"
license=('custom')
depends=('wine' 'winetricks' 'bash' 'coreutils')
source=("installer.exe::http://viewer.d.cnki.net/CAJViewer%207.2.self.exe"
        "cajviewer"
        "cajviewer.png"
        "cajviewer.desktop")
sha256sums=('d84d952ac0a62782c6919e61f8be4266511b7192dc63abbe7bd059110d15a3ec'
            'b05e47769cf5b6e521ae66b3f8bf905cbd84f0d9f689cfb80957b6dbe1209d25'
            '2e938f1665162063532db1142c3a463f6e9adf39022f24c0bb06d620d4c6683b'
            '25ebc5b39e44dbb2eea523b4d299cb15011018ca4e071aae96dc35bc68cdfe83')

package() {
	cd "$srcdir"
    install -D -m644 "installer.exe" "${pkgdir}/usr/share/cajviewer/installer.exe"
    install -D -m755 "cajviewer" "${pkgdir}/usr/bin/cajviewer"
    install -D -m644 "cajviewer.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/cajviewer.png"
    install -D -m644 "cajviewer.desktop" "${pkgdir}/usr/share/applications/cajviewer.desktop"
}

