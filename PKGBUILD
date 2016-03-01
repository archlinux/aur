# Maintainer: sweetpea-aur@tentacle.net

pkgname=imgcat
pkgver=2.9.20160206
pkgrel=1
pkgdesc="bash script for iTerm2 v2.9+ that allows images to be displayed in a terminal session"
arch=('i686' 'x86_64')
url="https://iterm2.com/images.html"
depends=('bash')
license=('gpl')
source=("https://raw.githubusercontent.com/gnachman/iTerm2/v${pkgver}/tests/${pkgname}")
md5sums=('2bd63c22c24b77251a110ed0f0fe527a')

package() {
cd $srcdir
install -Dm755 imgcat $pkgdir/usr/bin/imgcat
}
