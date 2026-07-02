# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/hrdr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=hrdr-bin
_pkgname=hrdr
pkgver=0.1.0
pkgrel=1
pkgdesc="herder — fast, agentic coding harness for OpenAI-compatible models (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/kryptic-sh/hrdr"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("hrdr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hrdr/releases/download/v${pkgver}/hrdr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("hrdr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hrdr/releases/download/v${pkgver}/hrdr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3e1d4f129543e5d48a39823a42686c1c1e19c8a5e9d824ab2a2af6d6086629d0')
sha256sums_aarch64=('f929525c947f4e26ca0f8cec60d29300aac00540739389d5329f771c7c1ad2f9')

package() {
    install -Dm755 "$srcdir/hrdr" "$pkgdir/usr/bin/hrdr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
