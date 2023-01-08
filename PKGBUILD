# Maintainer: Franklin Yu <franklinyu@google.com>
pkgname=iterm2-shell-integration
pkgver=3.4.19
pkgrel=1
pkgdesc='Shell integration of iTerm2, useful when SSH from macOS.'
arch=('any')
url="https://iterm2.com"
license=('GPL')
source=("https://github.com/gnachman/iTerm2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf8a6583bb2796f25d66f708b27103f7aaf0b78896284daa649450cfc3730d3f')

package() {
	cd "iTerm2-${pkgver}/Resources/shell_integration"
	install -D --mode=644 iterm2_shell_integration.zsh \
		"${pkgdir}/usr/share/zsh/plugins/iterm2_shell_integration.zsh"
}
