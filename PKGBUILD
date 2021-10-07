# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli-bin
pkgver=0.1.0
pkgrel=2
epoch=
pkgdesc="Syncing dotfiles and more"
arch=("x86_64")
url="https://github.com/blurgyy/dt"
license=('MIT OR Apache 2.0')
groups=()
depends=()
makedepends=(
    curl
)
checkdepends=()
optdepends=()
provides=("dt-cli")
conflicts=("dt-cli" "dt-cli-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/blurgyy/dt/releases/download/v${pkgver}/dt-cli"
        "https://raw.githubusercontent.com/blurgyy/dt/v${pkgver}/LICENSE")
sha256sums=("013e06480b81d9a62183fd4d1b1d7d55c48ff6204b40f841481b64a152a6c254"
            "1aac13b1e305a9a4f6a8a5a7123f3abd092c59b2696d1bde3df32eac0b934322")
noextract=()
validpgpkeys=()

package() {
    install -Dm755 "dt-cli" "$pkgdir/usr/bin/dt-cli"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/dt/LICENSE"
}
