# Maintainer: dev-bhaskar8 <vaas.ygg@gmail.com>
pkgname=gitside-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='VS Code-inspired source control panel for the terminal'
arch=('x86_64' 'aarch64')
url='https://dev-bhaskar8.github.io/gitside/'
license=('MIT')
depends=('git')
provides=('gitside')
conflicts=('gitside')
source_x86_64=("gitside-${pkgver}-x86_64.tar.xz::https://github.com/dev-bhaskar8/gitside/releases/download/v${pkgver}/gitside-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("gitside-${pkgver}-aarch64.tar.xz::https://github.com/dev-bhaskar8/gitside/releases/download/v${pkgver}/gitside-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('cab285432d5176e8d1976cf3af7f78b154ca06a497b0b72a6c18fb208b0d2bd1')
sha256sums_aarch64=('65454189e1e0d28f4779751249a29b43303a5066f0ec4663a1c12de247567edf')

package() {
  install -Dm755 gitside "$pkgdir/usr/bin/gitside"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
