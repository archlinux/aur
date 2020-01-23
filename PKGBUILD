# Maintainer: Fancy <springzfx at gmail.com>
pkgbase=lx-music-desktop
pkgname=('lx-music-desktop-bin')
pkgver=0.15.0
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('d426f3074b50c83a600ae2dae978190268d9967e88c8aee465d46e7691f4114e6f12b3af9b0cfd6f618aefb3c8412cb00bd84da8663664cdda1c73558c942fe3')

package_lx-music-desktop-bin(){
	tar xf data.tar.xz -C "${pkgdir}"
}
