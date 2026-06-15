# Maintainer: IRRatium <https://github.com/IRRatium>
pkgname=stockings
pkgver=1.0.2
pkgrel=1
pkgdesc="Joke package: opens a Google search for 'buy stockings' once on install. Not a virus."
arch=('any')
url="https://github.com/IRRatium/stockings-aur"
license=('MIT')
depends=('xdg-utils' 'util-linux')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cat <<'EOF'

   ┌──────────────────────────────────────────────────────────────┐
   │                                                              │
   │   stockings.aur — a tiny joke package                        │
   │                                                              │
   │   this is NOT a virus. read the .install, it's 40 lines.     │
   │   on install: one google search opens, once. that's all.     │
   │   on remove:  literally nothing happens. you're free.        │
   │                                                              │
   │   ──────────────────────────────────────────────────         │
   │                                                              │
   │   every arch user is a femboy until proven otherwise.        │
   │   proof requires presenting the thigh-highs to the kernel.   │
   │                                                              │
   │   you compile your own bootloader. you tile your windows.    │
   │   you deserve nice stockings. it's only fair, really.        │
   │                                                              │
   │   uwu ♡  happy ricing                                        │
   │                                                              │
   └──────────────────────────────────────────────────────────────┘

EOF
}

package() {
    cd "$srcdir/stockings-aur-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
