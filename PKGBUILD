# Maintainer: Fancy <springzfx at gmail.com>
pkgbase=lx-music-desktop
pkgname=('lx-music-desktop-bin')
pkgver=0.16.0
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('7426c3bc38062b6e6381cebdf1ed44a74fe7d27c4e8f451574ee16d0c90caaece6d590ba279052ba3b4c3ed503dbed77ecde4166862cc0381f102ac4ba6d47f0')

package_lx-music-desktop-bin(){
	tar xf data.tar.xz -C "${pkgdir}"
}
