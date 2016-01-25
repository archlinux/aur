# Maintainer: PitBall

pkgname=vim-ack
pkgver=1.0.9
pkgrel=1
pkgdesc='This plugin was designed as a Vim frontend for the Perl module App::Ack'
arch=('any')
license=('GPL')
depends=('vim' 'ack')
url='http://www.vim.org/scripts/script.php?script_id=2572'
source=($pkgname-$pkgver.tar.gz::https://github.com/mileszs/ack.vim/archive/$pkgver.tar.gz)
md5sums=('2dc52e3eed4c65971dbd65ee1b174533')
install=install

      package() {
	      install -d $pkgdir/usr/share/vim/vimfiles
	      cp -a ack.vim-$pkgver/{autoload,doc,ftplugin,plugin} \
		      $pkgdir/usr/share/vim/vimfiles/
	    }
