# Maintainer: kmz <valesail7@gmail.com>
pkgname=ttf-monaco-nerd-font
pkgver=2.2.2
pkgrel=1
pkgdesc='Monaco font patched with ryanoasis’s nerd patcher'
arch=('any')
url='https://github.com/Karmenzind/monaco-nerd-fonts'
license=('custom:Apple')
depends=()
makedepends=()
source=('COPYRIGHT' 'monaco-git::git+https://github.com/Karmenzind/monaco-nerd-fonts')
sha256sums=('75b450280572bdc340a5eac682ea7320776db78e378b5f0bd414a9f3538ee654' 'SKIP')

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/monaco-git/fonts/Monaco Nerd Font Complete.ttf" "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/monaco-git/fonts/Monaco Nerd Font Complete Mono.ttf" "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}"
}                           
