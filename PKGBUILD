# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
source_x86_64=("keifu-v$pkgver-x86_64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("keifu-v$pkgver-aarch64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/LICENSE"
        "README.md-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/README.md")
sha256sums=('fff55e233457a73b20e6b2e9b37f9ecc18a4addc63ad8785e7d8fd97f0acdae7'
            '3e122bbebe30cddb3aec2fc5d1f7306bda9588c3fa9e2152b3e4c99423dc53b4')
sha256sums_x86_64=('14f977aff2e493731bc808e901a72b58064e1e7f3d759ef70d5dc219d8c2a15a')
sha256sums_aarch64=('2349cba69c3b78c742bbfd8af567176290db5a9f36bc9e4cbede864b53df8692')
arch=('x86_64' 'aarch64')
depends=('git')
provides=('keifu')
conflicts=('keifu')

package() {
    install -Dm755 "$srcdir/keifu" "$pkgdir/usr/bin/keifu"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md-v$pkgver" "$pkgdir/usr/share/doc/keifu/README.md"
}
