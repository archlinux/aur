# Maintainer: Christoph Brill <opensource@archlinux.org>

pkgname=zsh-prompt-gentoo
pkgver=1
pkgrel=2
pkgdesc="zsh prompt from Gentoo Linux"
arch=('any')
url="https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/zsh/files/prompt_gentoo_setup-${pkgver}"
license=('GPL')
depends=('zsh')
source=("prompt_gentoo_setup-${pkgver}")
sha256sums=('818aede5695c1406bd2e720ab114bef13d373e48ee5a1f2cda7d36a9c26e30e1')

package() {
	mkdir -p "$pkgdir/usr/share/zsh/functions/Prompts"
	cp "${srcdir}/prompt_gentoo_setup-${pkgver}" "$pkgdir/usr/share/zsh/functions/Prompts/prompt_gentoo_setup"
}
