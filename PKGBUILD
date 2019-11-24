# Maintainer: Fancy <springzfx at gmail.com>
pkgname=lx-music-desktop
pkgver=0.12.0
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('d237cecb38826fb5ffef24494505521b6ca466ef90d6a7a063b1386a2646a020ae1ab8b6ef726a14952cf574a804ba32d08faa0a719b856e9132ab5470c67c1e')

package(){
	tar xf data.tar.xz -C "${pkgdir}"
}
