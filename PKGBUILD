# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contribuor: V. claw <vinzzer@protonmail.com>

pkgname=pastesearch
pkgver=2021.05.20
pkgrel=1
pkgdesc='Cli pastebin searcher'
url="https://github.com/mmpx12/pastesearch"
arch=('any')
license=('MIT')
depends=('curl' 'jq')
source=("${pkgname}-${pkgver}::https://github.com/mmpx12/pastesearch/archive/refs/tags/bash.tar.gz")
sha256sums=('8084999580617aea2f502e57fb54c00f7ef06d17d43a7201d09c1db5ebe92eb3')

package() {
    cd "${pkgname}-bash"
    install -Dm755 pastesearch.sh ${pkgdir}/usr/bin/pastesearch
    install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}

