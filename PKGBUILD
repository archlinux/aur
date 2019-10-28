# Maintainer: Fancy <springzfx at gmail.com>
pkgname=lx-music-desktop
pkgver=0.9.1
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('0a6862529a32abfe5f9144aab0d6843d6cf60179b9d979ed4001f3a152b45a07e416c5e0b0b7913fc4d3f44522d28faa6829807aab7d7c8eb2c55c7ce5c0c67d')

package(){
	tar xf data.tar.xz -C "${pkgdir}"
}
