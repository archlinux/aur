pkgname=himitsu-bako-bin
pkgver=1.0.0
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
sha256sums=('7e0715d4ae93466fbea038726dd9fcb168a20df04c178b0eb2ed8f079402b758')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" \
                 "$pkgdir/usr/bin/himitsu-bako"
}
