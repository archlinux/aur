# Maintainer: NNB <nnbnh@protonmail.com>
pkgname=ttf-bmono
pkgver=11.2.2
pkgrel=1
pkgdesc='Mono font that SuperB'
url='https://github.com/NNBnh/bmono'
license=('OFL')
arch=('any')
provides=('ttf-font')
source=("https://github.com/NNBnh/bmono/releases/download/v1.2-${pkgver}/bmono-ttf.zip")
sha256sums=('30f4c2d5f55c77ead535f191d377f3b91e9a250f60c99e953772973718f219af')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

