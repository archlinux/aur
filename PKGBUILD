# Maintainer: nroi <nroi@mailbox.org>
pkgname=waitforfile
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="Wait until the given file exists"
arch=('x86_64')
url="https://github.com/nroi/waitforfile"
license=('MIT')
depends=()
source=('https://github.com/nroi/waitforfile/releases/download/v0.1.3/waitforfile-v0.1.3-x86_64-unknown-linux-gnu.tar.gz'
        'https://raw.githubusercontent.com/nroi/waitforfile/master/LICENSE')
sha256sums=('37344a4dc1eab6a3a746331395a010f0af7a3f759def26e410337c65998ed255'
            'ea5ae48090d056687e6cd7aee08077128e2e217a4708470a4997c606c7fc1157')

package() {
    tar xf "${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
    install -Dm755 waitforfile "${pkgdir}/usr/bin/waitforfile"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
