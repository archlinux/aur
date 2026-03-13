pkgname=susshi-bin
pkgver=0.13.0
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
b2sums=(b1622e8775b3ef68a1fdc87f924d24ee1838725763254e6561caa0e7ff8e2b9159a6bcc5149c2e3dee7a7a8b1e19c4820c3b94012d6189022ab0d39f9e966dec)
b2sums_x86_64=(c1ef81367c43b3e6fc22c447fc923a2000573eca8a72acbfb7b341ccefefc366fdcbcb0ce561bbdc7059b4cb8cbecdf6fcf39c47cbbd42ac5fbc5db1b6610930)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
