# Maintainer: felinae98 <felinae98@gmail.com>
pkgname=slackcli-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Slack CLI for humans and AI agents. Read, send, search and reply across one or many Slack workspaces from the terminal. No Slack app needed."
arch=('x86_64' 'aarch64')
url="https://slackcli.dev/"
license=('MIT')
provides=('slackcli')
conflicts=('slackcli')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/shaharia-lab/slackcli/releases/download/v$pkgver/slackcli-linux"
  "https://raw.githubusercontent.com/shaharia-lab/slackcli/v$pkgver/LICENSE")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/shaharia-lab/slackcli/releases/download/v$pkgver/slackcli-linux-arm64"
  "https://raw.githubusercontent.com/shaharia-lab/slackcli/v$pkgver/LICENSE")
sha256sums_x86_64=('7f536ea11813fe50613a6f808b78d188b68cdcbe780892c5c532b05de22fa7d0'
                   '847df4e4f2b572db4146182cf99d9286d81e69ff82a93de63679a9725fb7e8c2')
sha256sums_aarch64=('34ce482f69dc249e593e034ecd46b2494e669a28253c609b1b7a439c7d8aa102'
                    '847df4e4f2b572db4146182cf99d9286d81e69ff82a93de63679a9725fb7e8c2')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/slackcli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
