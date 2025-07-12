# Maintainer: mvtab <mvtabilitas@protonmail.com>
pkgname="aurx"
pkgver="1.0.0"
pkgrel=1
pkgdesc="A simple bash script for easily managing AUR installs."
arch=("x86_64")
url="https://github.com/mvtab/aurx"
license=("GPL-3.0-only")
depends=("curl>=7.68.0" "git" "jq")
source=("aurx")
sha256sums=("6c380fbf80c038738a8818aaca800a2d73441c8e151d336f481b08e4e0a6a8e9")

package() {
	install -Dm755 "${srcdir}/aurx" "${pkgdir}/usr/bin/aurx"
	echo "[i] For bash completion you can: 'source <(aurx completion bash)'"
}

