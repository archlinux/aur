# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=skills-manager-bin
pkgver=1.40.0
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
source_x86_64=("https://github.com/xingkongliang/skills-manager/releases/download/v$pkgver/skills-manager-${pkgver}-1.x86_64.rpm")
b2sums_x86_64=('d8a4b497597f0f90f579d365f7df538a169062a9bf9c637e341ba54fa8ee7ddbe06b4e8216de2c9cd6f336d3305fd24367e5a7b419df932de5e51185f2d46787')
noextract=('skills-manager-${pkgver}-1.x86_64.rpm')

package() {
	bsdtar -xf "$srcdir/skills-manager-${pkgver}-1.x86_64.rpm" -C "$pkgdir"
}
