pkgname=cajviewer
pkgver=7.3
pkgrel=2
pkgdesc="Document Viewer for TEB, CAJ, NH, KDH and PDF format"
arch=(x86_64)
url="http://cajviewer.cnki.net/"
license=('custom')
depends=('wine' 'winetricks' 'bash' 'coreutils')
source=("installer.exe::http://viewer.d.cnki.net/CAJViewer%207.3.self.exe"
        "cajviewer"
        "cajviewer.png"
        "cajviewer.desktop")
sha256sums=('110c301dc1f8c160a3ce64ee7ab17baaa1c7655bfd8124558fdffadfe2e84541'
            'a6bbe1f7078513dbdc51e9f4cba99d02bb50219f3777ecff065777a1eb5e3fe6'
            '2e938f1665162063532db1142c3a463f6e9adf39022f24c0bb06d620d4c6683b'
            '25ebc5b39e44dbb2eea523b4d299cb15011018ca4e071aae96dc35bc68cdfe83')

package() {
	cd "$srcdir"
    install -D -m644 "installer.exe" "${pkgdir}/usr/share/cajviewer/installer.exe"
    install -D -m755 "cajviewer" "${pkgdir}/usr/bin/cajviewer"
    install -D -m644 "cajviewer.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/cajviewer.png"
    install -D -m644 "cajviewer.desktop" "${pkgdir}/usr/share/applications/cajviewer.desktop"
}

