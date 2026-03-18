pkgname=susshi-bin
pkgver=0.13.4
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
b2sums=(8aad6ae54fee57b81eb7ecb43537abe3f77df1efaeba6f06484557eabfd8c71de851730220c04a9c371df596877ea4bc3680f35290db244ca781b4354e849191)
b2sums_x86_64=(3b098421483a61ada0ca3660b5bbf8b08538ec99299c86deef33266a5c8fca0ec14cf09c7dcba57b6ac58f12fd2a23e0489849092b55ef159f9019076d83d004)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
