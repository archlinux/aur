# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
source_x86_64=("keifu-v$pkgver-x86_64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("keifu-v$pkgver-aarch64.tar.gz::https://github.com/trasta298/keifu/releases/download/v${pkgver}/keifu-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/LICENSE"
        "README.md-v$pkgver::https://raw.githubusercontent.com/trasta298/keifu/v${pkgver}/README.md")
sha256sums=('fff55e233457a73b20e6b2e9b37f9ecc18a4addc63ad8785e7d8fd97f0acdae7'
            '221090607b27981ee4d1802ecb8a491b0d7ca002b7146259bf7399f48dd1ac5a')
sha256sums_x86_64=('9c933af4ee395c25d1f199c3868db5cf688f2de42c54cca15ccd000a47365464')
sha256sums_aarch64=('98ee61d6a6483ae29571a741afe12fd8b2ebda252d1432e9495127e84715fd65')
arch=('x86_64' 'aarch64')
depends=('git')
provides=('keifu')
conflicts=('keifu')

package() {
    install -Dm755 "$srcdir/keifu" "$pkgdir/usr/bin/keifu"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md-v$pkgver" "$pkgdir/usr/share/doc/keifu/README.md"
}
