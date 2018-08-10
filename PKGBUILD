# Maintainer: Muhammad Al-Habib Ouadhour <HOuadhour@yandex.com>

pkgname=alun
pkgver=1.0
pkgrel=1
pkgdesc="A CLI tool that notify the user when there is an update, excluding AUR"
arch=('any')
url="https://github.com/HOuadhour/alun"
license=('GPL3')
depends=('cronie' 'pacman-contrib' 'libnotify' 'python' 'pacman')
optdepends=('dunst: get notification on i3 WM')
backup=('etc/alun/conf.py' 'etc/alun/crontab')
install=$pkgname.install
source=(
"https://github.com/HOuadhour/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
"https://github.com/HOuadhour/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=(
'94ca3f986166333eb33de22c383ece67870c68de552a6da5a171a81e1f212100'
'75f72a9303b07875996e4a69d29510939fc83c05a89349865ede6ef0a632300e'
)
validpgpkeys=('6481A7A3E66A3AA39D0DD7302A60AB408C14BF70')

package() {
    cd $pkgdir
    tar -xf $srcdir/$pkgname-$pkgver.tar.gz
}
