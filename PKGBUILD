# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=pokeshell
pkgver=1.0.0
pkgrel=8
pkgdesc="A shell program to show pokemon sprites in the terminal."
arch=('any')
url='https://github.com/acxz/pokeshell'
license=('GPLv3')
depends=('curl' 'jq' 'imagemagick' 'chafa')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/acxz/pokeshell/archive/v${pkgver}.tar.gz")
sha256sums=('d968781b1ede645c6528eefaf49dcf945eff0e19b8b02686414e3ec2b169e129')

build() {
    msg "Nothing to build"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p ${pkgdir}/usr/bin
    cp -v bin/pokeshell ${pkgdir}/usr/bin

    mkdir -p ${pkgdir}/usr/share/bash-completion/completions
    cp -v share/bash-completion/completions/pokeshell ${pkgdir}/usr/share/bash-completion/completions/pokeshell

    # mkdir -p ${pkgdir}/usr/share/zsh/site-functions
    # cp -v share/zsh/site-functions/_pokeshell ${pkgdir}/usr/share/zsh/site-functions/_pokeshell
}
