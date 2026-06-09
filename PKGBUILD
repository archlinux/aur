# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=skills-manager-bin
pkgver=1.23.0
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
b2sums_x86_64=('9b8081d4a2ca990fbb9c9388a7e822b20477eda16362e1e1d2b32a5c99c3a9f2e3ba828603f65caa162774e7c6a0e4904538c0485a861d283e014d6332be87ef')

package() {
	cd $pkgdir
	tar -xvf $srcdir/data.tar.gz
}
