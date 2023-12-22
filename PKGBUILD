# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=clash-console-tray-script
pkgver=0.1
pkgrel=1
pkgdesc="A clash config python script with tray"
arch=("any")
url="https://aur.archlinux.org/packages/clash-console-tray-script"
license=('MIT')
depends=(python)
source=(
clash-console-tray-script.png
clash-console.py
clash-meta-console.desktop
Readme.md
        )
sha256sums=('b4a4572a226e6649a2fd917e47ac339a17865e1b766e0e098776be241cf080c5'
            '3b6a477db7763fc22eae7dfe3880cc2a0c9972d2d30e021bd4c49c56c89986d2'
            '799cab737f3617cc608af1d959130e948e9c83940f6c1965f3d9cc5af8bac4cc'
            'cad0d1fe26f9d960fc86b39a1d71886d0d7532199883d63ccc6119cc6bab2688')

package() {
    install -Dm644 "clash-console-tray-script.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/clash-console-tray-script.png"
    install -Dm644 "clash-console.py" "${pkgdir}/opt/clash-console-tray-script/clash-console.py"
    install -Dm644 "clash-meta-console.desktop" "${pkgdir}/usr/share/applications/clash-meta-console.desktop"
    install -Dm644 "Readme.md" "${pkgdir}/opt/clash-console-tray-script/Readme.md"
} 
