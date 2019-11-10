# Maintainer: Fancy <springzfx at gmail.com>
pkgname=lx-music-desktop
pkgver=0.11.0
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('91344ec78ec325a5bfed774ac93a194c91fa55e32f6e9755723e8dbe26725ff2a8079fb8c26075f90c3451a6a19c3f80592fdb8d6d5cff6abf080e41d3fdc828')

package(){
	tar xf data.tar.xz -C "${pkgdir}"
}
