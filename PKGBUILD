# Maintainer: Anthony Nowell <anowell@gmail.com>

pkgname=algorithmia-bin
pkgver=1.0.0_beta.4
pkgrel=1
pkgdesc="Algorithmia command line interface tools"
arch=('x86_64')
url="https://algorithmia.com/"
license=('MIT')
depends=('')
conflicts=('algorithmia-bin')
source=("https://github.com/algorithmiaio/algorithmia-cli/releases/download/v${pkgver//_/-}/algorithmia-v${pkgver//_/-}-x86_64-unknown-linux-gnu.tar.gz")
md5sums=('b84ca1e619dcae5e2d0fe8fad7dc9fe5')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 algo "$pkgdir/usr/bin/"
  # install -m 644 completions/bash/algo "$pkgdir/usr/share/bash-completion/completions/"
  # install -m 644 completions/zsh/_algo "$pkgdir/usr/local/share/share/zsh/site-functions/"
}
