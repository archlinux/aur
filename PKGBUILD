# Maintainer: hegyesur <urhegyes at gmail dot com>
pkgname='prman-bin'
pkgver='1.0.7'
pkgrel=1
pkgdesc='Terminal project repository manager. (prebuilt binary release)'
arch=('x86_64')
url='https://github.com/bencetotht/prm'
license=('MIT' 'Apache-2.0')
depends=('git')
optdepends=(
  'lazygit: open lazygit with the g shortcut'
  'tmux: popup and terminal-window integrations'
)
provides=('prman')
conflicts=('prman' 'prm')
source=("prman-bin-1.0.7-x86_64.tar.gz::https://github.com/bencetotht/prm/releases/download/v1.0.7/prm-v1.0.7-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
  cd "prm-1.0.7-x86_64-unknown-linux-gnu"
  install -Dm755 "prm" "${pkgdir}/usr/bin/prm"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/prman-bin/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/prman-bin/LICENSE-APACHE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/prman-bin/README.md"
}
