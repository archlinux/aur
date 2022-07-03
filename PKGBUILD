# Maintainer: linuxer <linuxer@artixlinux.org>

pkgname=cascaydia-code-fonts
pkgver=2.1.0
pkgrel=4
pkgdesc='Cascaydia fonts with Nerd patches.'
arch=('x86_64')
license=('MIT'
         'Creative Commons 4.0'
         'Apache 2.0'
         'SIL OFT')

url='https://github.com/ryanoasis/nerd-fonts/'

source=("https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Regular/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.otf"
              "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Regular/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono.otf"
              "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Regular/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.otf"
              "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Regular/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.otf")

sha256sums=('SKIP' 
            'SKIP' 
            'SKIP'
            'SKIP') 

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/usr/share/fonts/otf/"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.otf"* "${pkgdir}/usr/share/fonts/otf/Caskaydia Cove Regular Nerd Font Complete Mono Windows Compatible.otf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono.otf"* "${pkgdir}/usr/share/fonts/otf/Caskaydia Cove Regular Nerd Font Complete Mono.otf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.otf"* "${pkgdir}/usr/share/fonts/otf/Caskaydia Cove Regular Nerd Font Complete Windows Compatible.otf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.otf"* "${pkgdir}/usr/share/fonts/otf/Caskaydia Cove Regular Nerd Font Complete.otf"

}
