# Maintainer: soymadip_1
pkgname=nsticky-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="A sticky windows manager CLI tool for Niri "
arch=('x86_64')
_repo="soymadip/nsticky"
url="https://github.com/${_repo}"
license=('BSD-3-Clause')
provides=('nsticky')
conflicts=('nsticky')
depends=('niri')

source=("$url/releases/download/v$pkgver/nsticky-v$pkgver-$arch"
        "https://raw.githubusercontent.com/$_repo/refs/heads/main/LICENSE"
)

sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "nsticky-v$pkgver-$arch" "$pkgdir/usr/bin/nsticky"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
