pkgname=susshi-bin
pkgver=0.13.6
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
b2sums=(a9cd3f8b0be2b03d5475001f2d7cf74a4b929d2b3358899f37d1eebf325cc4a980842c61bf5d8f5e05441ef4e20fc38be7aefdbfcff23034604c3a9c01ffd53d)
b2sums_x86_64=(012a13e49f9abbfca44d5ab24fbb7aa6fc27b6426cb19fd0d0f6c780a99ab97a1c9660a20ab1ca6b2fca5c1f0102ca65412d4481165b57de505d9f98bb7e7520)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
