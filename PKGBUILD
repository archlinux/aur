# Maintainer: PitBall

pkgname=vim-singlecompile
pkgver=2.12.0
pkgrel=1
pkgdesc='This plugin is aimed at making it more convenient to compile or run a single source file without leaving vim'
arch=('any')
license=('GPL')
depends=('vim')
url='http://singlecompile.topbug.net/'
source=($pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=22022)
md5sums=('206def5de211b04162a6e44eac2da35a')
install=install

      package() {
	      install -d $pkgdir/usr/share/vim/vimfiles
	      cp -a {autoload,doc,plugin} \
		      $pkgdir/usr/share/vim/vimfiles/
	    }

