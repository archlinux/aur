# Maintainer: Angelo Verlain <hey@vixalien.com>

pkgname=supabase-bin
pkgver=0.38.5
pkgrel=1
pkgdesc="A CLI for Supabase, an open source Firebase alternative"
url="https://github.com/supabase/cli"
license=("MIT")
arch=("x86_64")
provides=("supabase")
conflicts=("supabase")
source=("https://github.com/supabase/cli/releases/download/v$pkgver/supabase_${pkgver}_linux_amd64.tar.gz")
sha256sums=("14c118f4bcf8302626138661abb8fd2a5ae87a35325fbbff741236fce2e74b03")

package() {
    install -Dm755 supabase -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
