# Maintainer: Fancy <springzfx at gmail.com>
pkgbase=lx-music-desktop
pkgname=('lx-music-desktop-bin')
pkgver=0.17.0
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('688d057f9777448e70d44728582ad92960ebfa8f423e6f7d5ab79b62540de457c332774ef3e422902f926965cee295ee04920038ed667d16d7199d6377ddd800')

package_lx-music-desktop-bin(){
	tar xf data.tar.xz -C "${pkgdir}"
}
