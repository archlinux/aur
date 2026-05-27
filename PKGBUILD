# Maintainer: MKookinho <ultrapeuscookbr@gmail.com>

pkgname=discli-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Discord CLI for AI agents. Manage servers, messages, reactions, threads and monitor events from the terminal."
arch=('any')
url="https://github.com/DevRohit06/discli"
license=('MIT')
depends=('python' 'python-click' 'python-discord')
makedepends=('python-pip')
source=("discord_cli_agent-${pkgver}-py3-none-any.whl::https://github.com/DevRohit06/discli/releases/download/v${pkgver}/discord_cli_agent-${pkgver}-py3-none-any.whl")
b2sums=('c3d35fb5b1df235c8b8504b7457bcb531b2a0c4846cf96f8bdfa21e9ba6f165dbd5ed8f0cf0eeb491d4c9990adbb1fb91ad69bb9e531a47d7c1537503ef4b640')

package() {
  python -m pip install \
    --prefix="$pkgdir/usr" \
    --no-deps \
    --ignore-installed \
    "$srcdir/discord_cli_agent-${pkgver}-py3-none-any.whl"
}
