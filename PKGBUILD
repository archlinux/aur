pkgname=wf-recorder-ui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Wayland-native desktop UI for wf-recorder'
arch=('x86_64')
url='https://github.com/LaurenceGuws/wf-recorder-ui'
license=('MIT')
depends=('wf-recorder')
source=("wf-recorder-ui-${pkgver}-amd64::https://github.com/LaurenceGuws/wf-recorder-ui/releases/download/beta/wf-recorder-ui-${pkgver}-amd64"
        "wf-recorder-ui.desktop"
        "wf-recorder-ui.png")
sha256sums=('bf7f1a9a752f8a63fea215d56a2df8b95e7b533995ab44cc1008a1bc493f0fa7'
            'd14576f2ee55e19924636c4a3c49dc1dd4b436b885eaf1d82b8f9416aef33e53'
            '9694ca5f747f457a20e0b524ad50ef148a0a43f5ff9e3a6cc15580fb1b92b757')

package() {
    install -Dm755 "${srcdir}/wf-recorder-ui-${pkgver}-amd64" "${pkgdir}/usr/bin/wf-recorder-ui"
    install -Dm644 "${srcdir}/wf-recorder-ui.desktop" "${pkgdir}/usr/share/applications/wf-recorder-ui.desktop"
    install -Dm644 "${srcdir}/wf-recorder-ui.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wf-recorder-ui.png"
}
