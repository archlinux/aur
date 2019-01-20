# Maintainer: Andrey Mukhin <andrey@nufl.ru>

pkgname=bashful
pkgver=0.1.1
pkgrel=1
pkgdesc='Shell scripts executor with ansible-like yaml configuration.'
arch=('x86_64')
url='https://github.com/wagoodman/bashful'
license=('MIT')
depends=('glibc')

source=("https://github.com/wagoodman/bashful/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ab9c8609df08bebf98d9b3ec9ce7d2f752cf77644c97f355bfa12a18b73f3ac6')

package() {
    install -Dm755 \
        "${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 \
        "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
