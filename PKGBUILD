# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=sss_code-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Terminal tool to take screenshots of your code"
url="https://github.com/SergioRibera/sss"
conflicts=('sss_code' 'sss_code-git')
license=('MIT' 'Apache-2.0')
arch=('x86_64')

source=("${url}/releases/download/sss_code/v${pkgver}/sss_code-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('10000bfe9013d37e727bdc2cb22dc71a0a07e930a2f042af5700a6265d0c2201')

package() {
    cd "sss_code-${arch}-unknown-linux-gnu"

    install -Dm755 sss_code "${pkgdir}/usr/bin/sss_code"

    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
