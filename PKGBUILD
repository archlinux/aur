# Maintainer: Fancy <springzfx at gmail.com>
pkgbase=lx-music-desktop
pkgname=('lx-music-desktop-bin')
pkgver=0.13.0
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('104b0b68d33b75875a95be520a5820e56238fcbe0cf63a80053a8db3fcc9795b15d0166338c65abb21917f139b447b114521f5df21ecb30f47aec10e81a14a0e')

package_lx-music-desktop-bin(){
	tar xf data.tar.xz -C "${pkgdir}"
}
