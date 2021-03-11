# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=traitor-bin
_pkgname=traitor
pkgver=0.0.2
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
  'f04a52623464ec2eb52b22e7348993bf5b7456714505f87342781b8d21c7233c'
  '560a808b309f05aa920031327ce068abe36038c917bd2092c69c23ff7acf3ede'
)

package() {
  install -Dm755 "$srcdir/traitor-amd64" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
