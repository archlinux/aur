# Maintainer: Artemy Fedotov <catlovescpp@gmail.com>

pkgname=sjconv-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple command-line convolver for JACK."
arch=('x86_64')
url="https://github.com/fstxz/sjconv"
license=('MIT')
depends=('jack')
options=('!strip')
provides=('sjconv')
conflicts=('sjconv')
source=("https://github.com/fstxz/sjconv/releases/download/v${pkgver}/sjconv-v${pkgver}-linux-x86_64.zip")
sha256sums=('970dc7ca4ddf8f74b25bcf7fead567e16e26667d69b58fe89790ee1651e442ed')

package() {
    install -Dm755 "sjconv" "${pkgdir}/usr/bin/sjconv"
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
