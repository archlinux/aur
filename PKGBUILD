# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=sss-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Terminal tool to take screenshots of your screen"
url="https://github.com/SergioRibera/sss"
conflicts=('sss' 'sss-git')
license=('MIT' 'Apache-2.0')
arch=('x86_64')

source=("${url}/releases/download/sss_cli/v${pkgver}/sss_cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('e59f3fdc97d925bd4560f8f7751d29194fd13cd770f48f3b0e3779114c37645b')

package() {
    cd "sss_cli-${arch}-unknown-linux-gnu"

    install -Dm755 sss "${pkgdir}/usr/bin/sss"

    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

