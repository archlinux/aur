# Maintainer: nroi <nroi@mailbox.org>
pkgname=waitforfile
pkgver=0.1.7
pkgrel=1
epoch=
pkgdesc="Wait until the given file exists"
arch=('x86_64' 'armv7h')
url="https://github.com/nroi/waitforfile"
license=('MIT')
depends=()
source=("https://raw.githubusercontent.com/nroi/${pkgname}/master/LICENSE")
source_x86_64+=("https://github.com/nroi/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_armv7h+=("https://github.com/nroi/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('ea5ae48090d056687e6cd7aee08077128e2e217a4708470a4997c606c7fc1157')
sha256sums_x86_64+=('544e6545b40c3b823c7fc0e1303c93bb7050270fccd7a391a8df63bd8113d0f0')
sha256sums_armv7h+=('237dd158755f10bc739e8a1536fabe83697c27639a67a959c1f57a3cc56d6ebf')

package() {
    install -Dm755 waitforfile "${pkgdir}/usr/bin/waitforfile"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
