# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=traitor-bin
_pkgname=traitor
pkgver=0.0.6
pkgrel=1
pkgdesc='Automatic Linux privesc via exploitation of low-hanging fruit.'
arch=('x86_64')
license=('MIT')
url="https://github.com/liamg/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/traitor-amd64"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '73e0810037eaca1b0a643396b61a0b6462582d89d952c0c20f96f800dbf5e2e5'
  'fe6f7eaad32d471d3eb8b7379b3f8f0caddf605a79b687f9f1dd2ad5c92c3592'
)

package() {
  install -Dm755 "$srcdir/traitor-amd64" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
