# Maintainer: nroi <nroi@mailbox.org>
pkgname=waitforfile
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="Wait until the given file exists"
arch=('x86_64' 'armv7h')
url="https://github.com/nroi/waitforfile"
license=('MIT')
depends=()
source=("https://raw.githubusercontent.com/nroi/${pkgname}/master/LICENSE")
source_x86_64+=("https://github.com/nroi/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686+=("https://github.com/nroi/${pkgname}/releases/download/${pkgver}/${pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
source_armv7h+=("https://github.com/nroi/${pkgname}/releases/download/${pkgver}/${pkgname}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
source_aarch64+=("https://github.com/nroi/${pkgname}/releases/download/${pkgver}/${pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('ea5ae48090d056687e6cd7aee08077128e2e217a4708470a4997c606c7fc1157')
sha256sums_x86_64+=('37344a4dc1eab6a3a746331395a010f0af7a3f759def26e410337c65998ed255')
sha256sums_i686+=('a67bfdae3753ec051a27f0c2a7a8efe984891a490673114064c8386d870cfc22')
sha256sums_armv7h+=('f078d9b89dc3859c884c679e8a569e6b94b52c9b967b2a18e13f5a201b2549af')
sha256sums_aarch64+=('b6f7d301be492147c37420e2f1aeb6f11b9c8466a5f5ee3874ace6b42851446d')

package() {
    install -Dm755 waitforfile "${pkgdir}/usr/bin/waitforfile"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
