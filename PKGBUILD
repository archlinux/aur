# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=skills-manager-bin
pkgver=1.14.1
pkgrel=1
epoch=
pkgdesc="A lightweight desktop app to manage, sync, and organize AI agent skills across 15+ coding tools — Cursor, Claude Code, Codex, Copilot, and more."
arch=('x86_64')
url="https://github.com/xingkongliang/skills-manager"
license=('MIT')
groups=()
depends=('webkit2gtk-4.1' 'gtk3' 'xz')
makedepends=()
checkdepends=()
optdepends=()
provides=('skills-manager')
conflicts=('skills-manager')
replaces=()
source_x86_64=("https://github.com/xingkongliang/skills-manager/releases/download/v$pkgver/skills-manager_${pkgver}_amd64.deb")
b2sums_x86_64=('6e7e46658cf41dc2854cdc5a5d047a674a4fefcaabf57c83ae64d10dc48a1b4aefa8e2b96da3238503eb23bdd5d0a38594c97b87ec0ac3eeda3ac70f01949ab0')

package() {
	cd $pkgdir
	tar -xvf $srcdir/data.tar.gz
}
