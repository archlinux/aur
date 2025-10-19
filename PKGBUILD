pkgname=art-of-smart-online-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Access your tutoring resources, notes, practice HSC questions, thousands of past papers, student forums & lots more!"
arch=('x86_64')
url="https://artofsmart.com.au"
license=('custom')
source=("art-of-smart-online.AppImage"
        "art-of-smart-online.desktop")
sha256sums=('1bc2c743657bfeac6323afddc0554814aa9d271a7c31e64730763b4e6d0b9da7'
            'SKIP')

package() {
    install -Dm755 "${srcdir}/art-of-smart-online.AppImage" "${pkgdir}/opt/art-of-smart-online/art-of-smart-online.AppImage"
    
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/art-of-smart-online/art-of-smart-online.AppImage" "${pkgdir}/usr/bin/art-of-smart-online"
    
    install -Dm644 "${srcdir}/art-of-smart-online.desktop" "${pkgdir}/usr/share/applications/art-of-smart-online.desktop"
}
