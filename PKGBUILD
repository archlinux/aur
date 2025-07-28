# Maintainer: mvtab <mvtabilitas@protonmail.com>
pkgname="aurx"
pkgver="1.0.3"
pkgrel=3
pkgdesc="A simple bash script for easily managing AUR installs."
arch=("x86_64")
url="https://github.com/mvtab/aurx"
license=("GPL-3.0-only")
depends=("curl>=7.68.0" "git" "jq")
source=("aurx")
sha256sums=("cb29104fb931351bdd65fc42ef301cd364776bfc9fb37c6265de22b8386bfead")

package() {
	install -Dm755 "${srcdir}/aurx" "${pkgdir}/usr/bin/aurx"
	echo "[i] For bash completion you can: 'source <(aurx completion bash)'"
}

