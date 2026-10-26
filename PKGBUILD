# Maintainer: Shanoa Ice <fuyutsuki98_r@outlook.com>

pkgname=skills-manager-bin
pkgver=1.43.0
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
b2sums_x86_64=('f5a17e196a29fcdbb78712333dd4c3a070b902e94858801cf8dabdfeb5ec815e5790cfe65d1a0e7245655d24ff2a6fd734267140d3ca9d527e5145b8af1e4d73')
noextract=('skills-manager-${pkgver}-1.x86_64.rpm')

package() {
	bsdtar -xf "$srcdir/skills-manager-${pkgver}-1.x86_64.rpm" -C "$pkgdir"
}
