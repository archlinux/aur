# Maintainer: mvtab <mvtabilitas@protonmail.com>
pkgname="aurx"
pkgver="1.0.6"
pkgrel=4
pkgdesc="A simple bash script for easily managing AUR installs."
arch=("x86_64")
url="https://github.com/mvtab/aurx"
license=("GPL-3.0-only")
depends=("curl>=7.68.0" "git" "jq")
source=("aurx")
sha256sums=(0231dda9b17bd598bd45818d0fcf2b08d5cf7d96b5a489ec20b1019b18f661c4)

package() {
	install -Dm755 "${srcdir}/aurx" "${pkgdir}/usr/bin/aurx"
	echo "[i] For bash completion you can: 'source <(aurx completion bash)'"
}
