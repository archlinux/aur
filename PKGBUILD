# Maintainer: shichirouji21 <shichirouji21@users.noreply.github.com>
pkgname=himitsu-bako-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Encrypted clipboard-backed secret storage using age'
arch=('x86_64')
url='https://github.com/shichirouji21/himitsu-bako'
license=('BSD-2-Clause')
depends=('fzf')
optdepends=('wl-clipboard: Wayland clipboard support'
            'xclip: X11 clipboard support'
            'xsel: alternative X11 clipboard support')
provides=('himitsu-bako')
conflicts=('himitsu-bako' 'himitsu-bako-git')
source=("$pkgname-$pkgver::${url}/releases/download/v${pkgver}/himitsu-bako")
noextract=("$pkgname-$pkgver")
sha256sums=('6673caea265d5c8a463cd52ad9abbfb0f7b7928afce2c05fda3660d66319fb47')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" \
                 "$pkgdir/usr/bin/himitsu-bako"
}
