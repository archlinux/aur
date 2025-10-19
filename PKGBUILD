pkgname=art-of-smart-online
pkgver=1.0.1
pkgrel=1
pkgdesc="Access your tutoring resources, notes, practice HSC questions, thousands of past papers, student forums & lots more!"
arch=('x86_64')
url="https://artofsmart.com.au"
license=('proprietary')
source=("https://github.com/Derukugis/art-of-smart-online/raw/refs/heads/master/art-of-smart-online.AppImage"
        "art-of-smart-online.desktop")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/art-of-smart-online.AppImage" "${pkgdir}/opt/art-of-smart-online/art-of-smart-online.AppImage"
    
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/art-of-smart-online/art-of-smart-online.AppImage" "${pkgdir}/usr/bin/art-of-smart-online"
    
    install -Dm644 "${srcdir}/art-of-smart-online.desktop" "${pkgdir}/usr/share/applications/art-of-smart-online.desktop"
}
