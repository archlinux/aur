# Maintainer: aitasks maintainers <noreply@aitasks.io>
pkgname=aitasks
pkgver=0.32.0
pkgrel=1
pkgdesc="Agentic IDE in your terminal: markdown tasks, YAML frontmatter, git-native"
arch=('any')
url="https://aitasks.io/"
license=('Apache')
depends=('bash>=4' 'python>=3.9' 'fzf' 'jq' 'git' 'zstd' 'tar' 'curl')
optdepends=('github-cli: GitHub integration'
            'glab: GitLab integration')
source=("ait::https://github.com/beyondeye/aitasks/releases/download/v$pkgver/ait")
sha256sums=('2a710d282e84ce0deaad73428dab21c67a71e970c9ea56afd2995d3a0a77e5db')

package() {
    install -Dm755 "$srcdir/ait" "$pkgdir/usr/bin/ait"
}
