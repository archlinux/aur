pkgname=bookokrat-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="Terminal-based EPUB and PDF reader with rich TUI"
arch=('x86_64')
url="https://github.com/bugzmanov/bookokrat"
license=('AGPL-3.0-only')
provides=('bookokrat')
conflicts=('bookokrat')

source=(
  "https://github.com/bugzmanov/bookokrat/releases/download/v${pkgver}/bookokrat-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('ede14b87b33f0106d7a75c46a89dfb0463f776b3716ca5d27aa94481cfbd53e1')

package() {
  install -Dm755 bookokrat "${pkgdir}/usr/bin/bookokrat"
}

