# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
pkgname=linuxqq-new
pkgver=2.0.1_429
pkgrel=1
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64')
url="https://im.qq.com/linuxqq/"
license=('unknown')
sha256sums=('e3aa15ff6ae089b655df3913c6020ca56726bd676995aaf29b313fbd0643ea42')
depends=('gtk3' 'libnotify' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret')
source=("https://dldir1.qq.com/qqfile/qq/QQNT/4691a571/QQ-v${pkgver//_/-}_x64.deb")

package() {
	cd "${srcdir}"
	tar -xvf data.tar.xz -C "${pkgdir}"
}

