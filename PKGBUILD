# Maintainer: nroi <nroi@mailbox.org>
pkgname=waitforfile
pkgver=0.1.6
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
sha256sums_x86_64+=('f5096afac172736910f0a8e80419709a16fb3c357ff44db4f0bc57d9ef05facc')
sha256sums_armv7h+=('4f132eacf06c87c89f93e5dcb5c1c1ff3d694d0d233f535f6c2efdb92e0c6afc')

package() {
    install -Dm755 waitforfile "${pkgdir}/usr/bin/waitforfile"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
