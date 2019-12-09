# Maintainer: Fancy <springzfx at gmail.com>
pkgbase=lx-music-desktop
pkgname=('lx-music-desktop-bin')
pkgver=0.12.1
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('e4688bc129411e5b39cf902835f1c906c900201aa70a18e358b2f11e86701b23a89c2589dbf28bb9e3ac6f6c8d504ed82814e71475bb82982393c2cb4e3f0f7e')

package_lx-music-desktop-bin(){
	tar xf data.tar.xz -C "${pkgdir}"
}
