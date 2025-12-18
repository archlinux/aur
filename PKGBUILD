# Maintainer: codekoala <arch@cloudlery.com>
pkgname=jswank-murmur-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="CLI tool for orchestrating configuration file generation and deployment using Jsonnet"
arch=('x86_64')
url="https://github.com/jswank/murmur"
license=('MIT')
provides=('jswank-murmur' 'murmur')
conflicts=('jswank-murmur' 'murmur' 'murmur-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jswank/murmur/releases/download/v${pkgver}/murmur_Linux_x86_64.tar.gz")
sha256sums=('27869eb1a7554d5f6cfa33ed23cd87904fbc96a18bc8e962d6a52817c3dc09e6')

package() {
    install -Dm755 murmur "${pkgdir}/usr/bin/murmur"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
