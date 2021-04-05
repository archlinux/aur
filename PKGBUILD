# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=zsh-gentoo-prompt
pkgver=20150808
pkgrel=1
pkgdesc="Extremely simple zsh prompt from Gentoo"
arch=('any')
url="https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/zsh"
license=('GPL')
depends=('zsh')
source=("https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/zsh/files/prompt_gentoo_setup-1")
sha256sums=('818aede5695c1406bd2e720ab114bef13d373e48ee5a1f2cda7d36a9c26e30e1')

package() {
  install -Dm644 prompt_gentoo_setup-1 \
    "$pkgdir"/usr/share/zsh/functions/Prompts/prompt_gentoo_setup
}
