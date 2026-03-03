pkgname=susshi-bin
pkgver=0.11.0
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
b2sums=(864a6dbfd347e64a9f3bcca57aa0ee92e524446ac1fc2b536a86e2c9b9d70c8d4e7dad4e25719d5d2bf8eb95c5fe7b2c913b1c4092442e2d86a6ded9b331150e)
b2sums_x86_64=(e1204b76dc89af7e129a636ea357cd12673f50b14d1d18e95e405e59605ffa992727c292ffcc65bc9c0aecfc8413ef9770771c146b3dd236bc65cc199527dc77)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
