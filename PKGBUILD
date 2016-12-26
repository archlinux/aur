# Maintainer: nroi <nroi@mailbox.org>
pkgname=waitforfile
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Wait until the given file exists"
arch=('any')
url="https://gist.github.com/nroi/fd0ef1dc267e4bb03de9800fc52e2497"
license=('MIT')
depends=('python' 'python-pyinotify')
source=('https://gist.githubusercontent.com/nroi/fd0ef1dc267e4bb03de9800fc52e2497/raw/70d56c7d116f58c360f2ecc8c2e45e334cf2b64f/waitforfile'
        'https://gist.githubusercontent.com/nroi/c4d167368b93f085f8b102032072098a/raw/d365cd35d7cca8abd3eb0af36bd9416b67a73f6f/MIT-License')
sha256sums=('e2d618cc097b7e2318865c551660a4feb4825a57002f7a97617081d09ffd19ed'
            '8c0a90b2eb044cadcf0054cd42ffdbedffbb9958112e5fa7f234bc9a15627ba6')

package() {
    install -Dm755 waitforfile "${pkgdir}/usr/bin/waitforfile"
    install -Dm644 MIT-License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
