# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=zsh-gentoo-prompt
pkgver=20220515
pkgrel=1
pkgdesc="Extremely simple zsh prompt from Gentoo"
arch=('any')
url="https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/zsh"
license=('GPL')
depends=('zsh')
source=("https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/zsh/files/prompt_gentoo_setup-1")
sha256sums=('52c31969b384a72c47f1543b4d2870fd1e1be6231b4417f9eefbaeabfdba2a99')

package() {
  install -Dm644 prompt_gentoo_setup-1 \
    "$pkgdir"/usr/share/zsh/functions/Prompts/prompt_gentoo_setup
}
