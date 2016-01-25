# Maintainer: PitBall

pkgname=vim-ref
pkgver=0.4.3
pkgrel=1
pkgdesc="Vim plugin to view the reference."
arch=('any')
license=('GPL')
depends=('vim')
url='http://www.vim.org/scripts/script.php?script_id=3067'
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=14809")
md5sums=('284916f5d424a2934f2e875eb5ce6635')
install=install

      package() {
	      install -d $pkgdir/usr/share/vim/vimfiles
	      cp -a {autoload,doc,plugin} \
		      $pkgdir/usr/share/vim/vimfiles/
	    }
