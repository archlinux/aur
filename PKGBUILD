# Maintainer: linuxer <linuxer@artixlinux.org>

pkgname=cascaydia-code-fonts
pkgver=2.1.0
pkgrel=3
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

sha256sums=('9616b21b286007facbd0f687c81ac42062b23e3d091ee45eda56a00e247c699e' 
            '737ec93b8761f6412bf62f898a186844d919135b39d1b1cbf031f15045ecbb17'
            '45bbbbf9c40acad1ef5e65227262f447a4a154468844ef5f404e67c2a8d6fd62'
            '3a176d509d48f51b4be5a5cc12ad39c5be118c219da872b1075780d243a97f57') 

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/usr/share/fonts/otf/"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.otf"* "${pkgdir}/usr/share/fonts/otf/Caskaydia Cove Regular Nerd Font Complete Mono Windows Compatible.otf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono.otf"* "${pkgdir}/usr/share/fonts/otf/Caskaydia Cove Regular Nerd Font Complete Mono.otf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.otf"* "${pkgdir}/usr/share/fonts/otf/Caskaydia Cove Regular Nerd Font Complete Windows Compatible.otf"
    cp "${srcdir}/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.otf"* "${pkgdir}/usr/share/fonts/otf/Caskaydia Cove Regular Nerd Font Complete.otf"

}
