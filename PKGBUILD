pkgname=susshi-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager (pre-built binary)'
url='https://github.com/yatoub/susshi'
license=('MIT')
depends=('openssh')
arch=('x86_64')
provides=('susshi')
conflicts=('susshi')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("susshi-${pkgver}-linux-amd64::https://github.com/yatoub/susshi/releases/download/v${pkgver}/susshi-linux-amd64")
b2sums=(fa243366a45bbf6ac86593f36ea8473853afdac15d9afc9b85162f0a5b016cff1e43a1a82f6c9f97b23bcf4c6a05dd21bc1c7f0c5de5bb18acac9263ed803bc7)
b2sums_x86_64=(b137e0a2f9f7816c44898c93ea6afb2e322c93884f50d46dd87872b8bf63e9211caebedd7d8f413fca6970d9ce6d29ba63fe3ef3a0ebabc729d6e0525c8cfc72)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
