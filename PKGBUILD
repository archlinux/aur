# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
source_x86_64=("keifu-v$pkgver-x86_64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("keifu-v$pkgver-aarch64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/LICENSE"
        "README.md-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/README.md")
sha256sums=('fff55e233457a73b20e6b2e9b37f9ecc18a4addc63ad8785e7d8fd97f0acdae7'
            'df9a05e237e01793a4f9ed5bc360d3d7b97387b7fa83bd1d8d0e217503af7ccd')
sha256sums_x86_64=('478edd63dab9820956c88985f56168921c4dbc64b766bb7673764010bb0928bd')
sha256sums_aarch64=('bfa24e03d95557c977f5d7780ad11e6998ecee60a7bb1cbd984bb3e2e14ee928')
arch=('x86_64' 'aarch64')
depends=('git')
provides=('keifu')
conflicts=('keifu')

package() {
    install -Dm755 "$srcdir/keifu" "$pkgdir/usr/bin/keifu"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md-v$pkgver" "$pkgdir/usr/share/doc/keifu/README.md"
}
