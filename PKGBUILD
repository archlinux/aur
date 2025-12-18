# Maintainer: mvtab <mvtabilitas@protonmail.com>
pkgname="aurx"
pkgver="1.0.5"
pkgrel=3
pkgdesc="A simple bash script for easily managing AUR installs."
arch=("x86_64")
url="https://github.com/mvtab/aurx"
license=("GPL-3.0-only")
depends=("curl>=7.68.0" "git" "jq")
source=("aurx")
sha256sums=(3ff6150c6b21bf1b3435fbdcc4bca4017655dbba41b0cfbf49d35e18febee664)

package() {
	install -Dm755 "${srcdir}/aurx" "${pkgdir}/usr/bin/aurx"
	echo "[i] For bash completion you can: 'source <(aurx completion bash)'"
}
