# Maintainer: Fancy <springzfx at gmail.com>
pkgname=lx-music-desktop
pkgver=0.10.0
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('3bbda6cda1f6b262f1e25e9356ee545db1972b4e3ceec5cf1ef0adb7adca78e1119704fd11081553553f98c0eebb8b79aaf0e1b01fb5a3d092c4bee46f6de5fa')

package(){
	tar xf data.tar.xz -C "${pkgdir}"
}
