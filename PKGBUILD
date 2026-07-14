# Maintainer: dz-vadim <dziuba.vadym@gmail.com>

pkgname=virtdisp
pkgver=1.1.0
pkgrel=1
pkgdesc="Tray icon service to use Android tablet as a second monitor via Krfb"
arch=('any')
url="https://aur.archlinux.org/packages/virtdisp"
license=('MIT')
depends=('python' 'python-pyqt6' 'krfb')
source=('virtdisp-tray.py'
        'virtdisp.desktop')
sha256sums=('4f5b4937af841293a6246a2f7f7be575b9755da0c58300eb67ccbd3d15254d65'
            '083157fa09b685ca65c0000e67a2466907d7b601df84c072e1770981532b5f68')

package() {
    # Встановлення основного скрипту
    install -Dm755 "${srcdir}/virtdisp-tray.py" "${pkgdir}/usr/bin/virtdisp" 
    
    # Встановлення desktop-файлу для меню та автозапуску
    install -Dm644 "${srcdir}/virtdisp.desktop" "${pkgdir}/usr/share/applications/virtdisp.desktop" 
}
