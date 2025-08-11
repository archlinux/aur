# Maintainer: Voislav V. <voyo@thelazysre.com>
pkgname=td-tui
pkgver=0.4.2
pkgrel=1
pkgdesc="Simple task management TUI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/voioo/td"
license=('0BSD')
provides=('td')
conflicts=('td')

source_x86_64=("https://github.com/voioo/td/releases/download/v${pkgver}/td_linux_amd64.tar.gz")
source_aarch64=("https://github.com/voioo/td/releases/download/v${pkgver}/td_linux_arm64.tar.gz")
sha256sums_x86_64=('ad6052c701fa4249d4d7378712858e23a294f50e3f5b77e782158c037a4b481d')
sha256sums_aarch64=('6d2fa939d2ccf3d0e9da67084cd24e843bcfbb3410c3a893349fc6ad3e7fd11e')

package() {
    install -Dm755 td "${pkgdir}/usr/bin/td"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
