# Maintainer: linuxer <linuxer@artixlinux.org>

pkgname=cascaydia-code-fonts
pkgver=2.1.0
pkgrel=1
pkgdesc='Cascaydia fonts with Nerd patches.'
arch=('x86_64')
license=('MIT')
url='https://github.com/ryanoasis/nerd-fonts/'

source=("https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf"
        "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
        "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf"
        "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.ttf")
noextract=('Caskaydia Cove Regular Nerd Font Complete Mono Windows Compatible.ttf'
           'Caskaydia Cove Regular Nerd Font Complete Mono.ttf'
           'Caskaydia Cove Regular Nerd Font Complete Windows Compatible.ttf'
           'Caskaydia Cove Regular Nerd Font Complete.ttf')

sha256sums=('ccbbc5b4ff2aaf99261d78426e59fb24996b56161858149a2a984097070295fd' 
            '0114b6b311271e7e4975ca05419f6921035dc63628b0f4eb55028ea4e0767991'
            'c1630546abd0a3c2502eb81b0b8d46ea186de8196acf2f894106a804f581a379'
            '5ec51303efcda3a1cdd3a01b32a1595bbbcecae5f48dad4a0bd376aa03f312a7') 

package() {
    cd "$srcdir"
       
    install -d -m 755 "${pkgdir}/usr/share/fonts/TTF/"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf"* "${pkgdir}/usr/share/fonts/TTF/Caskaydia Cove Regular Nerd Font Complete Mono Windows Compatible.ttf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"* "${pkgdir}/usr/share/fonts/TTF/Caskaydia Cove Regular Nerd Font Complete Mono.ttf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf"* "${pkgdir}/usr/share/fonts/TTF/Caskaydia Cove Regular Nerd Font Complete Windows Compatible.ttf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.ttf"* "${pkgdir}/usr/share/fonts/TTF/Caskaydia Cove Regular Nerd Font Complete.ttf"

}
