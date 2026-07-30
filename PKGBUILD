# Maintainer: Shwetank Gupta <shwetankg07@gmail.com>
pkgname=shwetank
pkgver=2026.7.30
pkgrel=1
pkgdesc="Developer, student, builder. Prints a business card and a man page."
arch=('any')
url="https://github.com/shwetankg07/shwetank.dev"
license=('MIT')
depends=('bash')
optdepends=(
  'nodejs: for the interactive version, npx shwetank'
  'cowsay: for when you want the card, but worse'
)
source=('shwetank' 'shwetank.1' 'LICENSE')
sha256sums=('9170f17cfcb2eece965452cb20d43a603fcd277a6e4de9236c41c138f39154ac'
            '75c6d70f87cd4da26c79544a43ec7cbcccd047363834d308c6d20c83346a6b28'
            '2faf3af98c763655fd9db38d0c08748145207f0d16d3848a4af6c6bf084d83a3')

package() {
  install -Dm755 "$srcdir/shwetank" "$pkgdir/usr/bin/shwetank"
  install -Dm644 "$srcdir/shwetank.1" "$pkgdir/usr/share/man/man1/shwetank.1"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
