# Maintainer: aitasks maintainers <noreply@aitasks.io>
pkgname=aitasks
pkgver=0.24.0
pkgrel=1
pkgdesc="Agentic IDE in your terminal: markdown tasks, YAML frontmatter, git-native"
arch=('any')
url="https://aitasks.io/"
license=('Apache')
depends=('bash>=4' 'python>=3.9' 'fzf' 'jq' 'git' 'zstd' 'tar' 'curl')
optdepends=('github-cli: GitHub integration'
            'glab: GitLab integration')
source=("ait::https://github.com/beyondeye/aitasks/releases/download/v$pkgver/ait")
sha256sums=('ad4e92f3fe00549f8fb4c92b977fd462bc4df02454270404cfc762dd516fb5bd')

package() {
    install -Dm755 "$srcdir/ait" "$pkgdir/usr/bin/ait"
}
