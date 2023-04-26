# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Jules Sam Randolph <jules.sam.randolph@gmail.com>

pkgname=ttf-meslo-nerd-font-powerlevel10k
_commit='145eb9fbc2f42ee408dacd9b22d8e6e0e553f83d'
pkgver=2.3.3
pkgrel=1
pkgdesc='Meslo Nerd Font patched for Powerlevel10k'
arch=('any')
url='https://github.com/romkatv/powerlevel10k-media'
license=('Apache')
depends=()
provides=('nerd-fonts-meslo-p10k')
source=("MesloLGS-NF-Bold-${pkgver}.ttf::https://github.com/romkatv/powerlevel10k-media/raw/${_commit}/MesloLGS%20NF%20Bold.ttf"
    "MesloLGS-NF-Bold-Italic-${pkgver}.ttf::https://github.com/romkatv/powerlevel10k-media/raw/${_commit}/MesloLGS%20NF%20Bold%20Italic.ttf"
    "MesloLGS-NF-Italic-${pkgver}.ttf::https://github.com/romkatv/powerlevel10k-media/raw/${_commit}/MesloLGS%20NF%20Italic.ttf"
    "MesloLGS-NF-Regular-${pkgver}.ttf::https://github.com/romkatv/powerlevel10k-media/raw/${_commit}/MesloLGS%20NF%20Regular.ttf")
sha256sums=('b6c0199cf7c7483c8343ea020658925e6de0aeb318b89908152fcb4d19226003'
    '56b4131adecec052c4b324efb818dd326d586dbc316fc68f98f1cae2eb8d1220'
    '6f357bcbe2597704e157a915625928bca38364a89c22a4ac36e7a116dcd392ef'
    'd97946186e97f8d7c0139e8983abf40a1d2d086924f2c5dbf1c29bd8f2c6e57d')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 MesloLGS-NF-Bold-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/MesloLGS-NF-Bold-Italic.ttf"
    install -m 644 MesloLGS-NF-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/MesloLGS-NF-Italic.ttf"
    install -m 644 MesloLGS-NF-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/MesloLGS-NF-Bold.ttf"
    install -m 644 MesloLGS-NF-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/MesloLGS-NF-Regular.ttf"
}
