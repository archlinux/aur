# Maintainer: Mittens2001 <mittens2001@opmbx.org>

pkgname=vim-apprentice
_name=Apprentice
_srcname=apprentice
pkgver=1.9
pkgrel=1
pkgdesc="A dark, low-contrast colorscheme for Vim based on Sorcerer by Jeet Sukumaran"
arch=('any')
url="https://github.com/romainl/Apprentice"
license=('MIT')
depends=('vim')
source=("https://github.com/romainl/Apprentice/archive/v${pkgver}.tar.gz")
md5sums=('5cfaa954ea227a0fc4acd8aeaf10d94f')

package()
{
	cd "$_name-$pkgver"
	install -Dm644 colors/$_srcname.vim "$pkgdir/usr/share/vim/vimfiles/colors/$_srcname.vim"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
