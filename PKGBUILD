# Maintainer: Jules Sam Randolph <jules.sam.randolph@gmail.com>

pkgname=ttf-meslo-nerd-font-powerlevel10k
_commit='28dd1bd968b0c9cd4add7a3b80b264acdc53bcc7'
pkgver=1.000
pkgrel=2
pkgdesc='Meslo Nerd Font patched for Powerlevel10k'
arch=('any')
url='https://github.com/romkatv/powerlevel10k-media'
license=('MIT')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
groups=('nerd-fonts')
provides=('nerd-fonts-meslo-p10k')
source=("MesloLGS-NF-Bold-${pkgver}.ttf::https://github.com/romkatv/powerlevel10k-media/raw/${_commit}/MesloLGS%20NF%20Bold.ttf"
    "MesloLGS-NF-Bold-Italic-${pkgver}.ttf::https://github.com/romkatv/powerlevel10k-media/raw/${_commit}/MesloLGS%20NF%20Bold%20Italic.ttf"
    "MesloLGS-NF-Italic-${pkgver}.ttf::https://github.com/romkatv/powerlevel10k-media/raw/${_commit}/MesloLGS%20NF%20Italic.ttf"
    "MesloLGS-NF-Regular-${pkgver}.ttf::https://github.com/romkatv/powerlevel10k-media/raw/${_commit}/MesloLGS%20NF%20Regular.ttf")
sha256sums=('ebdc86f4dbac57ec81e3b7b6f2e6fa182b4ac74e928f2035d398000404f42b71'
    '7fed7e876c1a911ebdd83cb861d4d26fc81376da2018ac8d704a99897c35b83c'
    'ffbb03ec5ae9be0bed5609c423f1846c59d94641c4f6a2ddf94e24f8c7958290'
    '9192e07bc2e8aa973931b86f2ac6946d727319b07f1fdf1a90756b0da9accdcb')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 MesloLGS-NF-Bold-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/MesloLGS-NF-Bold-Italic.ttf"
    install -m 644 MesloLGS-NF-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/MesloLGS-NF-Italic.ttf"
    install -m 644 MesloLGS-NF-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/MesloLGS-NF-Bold.ttf"
    install -m 644 MesloLGS-NF-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/MesloLGS-NF-Regular.ttf"
}
