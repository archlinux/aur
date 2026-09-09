# Maintainer: felinae98 <felinae98@gmail.com>
pkgname=slackcli-bin
pkgver=0.11.0
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
sha256sums_x86_64=('75cb9a4950258670376f0df9f460ef35a38ebda93e04a43656272905ca5c9ee5'
                    '847df4e4f2b572db4146182cf99d9286d81e69ff82a93de63679a9725fb7e8c2')
sha256sums_aarch64=('52a8b7086655cf7066b1c08c1a50a43018661efaafb31944a4284f56f6efb007'
                     '847df4e4f2b572db4146182cf99d9286d81e69ff82a93de63679a9725fb7e8c2')

package() {
    install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/slackcli"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
