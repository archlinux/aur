pkgname=susshi-bin
pkgver=0.12.2
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
b2sums=(e62b41ec8efe5ad0c9d51114bc83722525c23f64e6fdc848a4b25d1321e3d991b2fb371fb7385952569dd63e6dbdec26cfcc4b9b2ee47013fa0cf1a9046732b9)
b2sums_x86_64=(cc7e5d16a9b6cbbfe956465c53f13b2dc8e375015a4de3c296f64eaddd78dbbf1c38b3ed91c0db2e8a42ed66cbf17749026ea748f5b6f28998c258a5829667b0)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
