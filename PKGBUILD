# Maintainer: PitBall

pkgname=vim-ragtag
pkgver=2.0
pkgrel=1
pkgdesc="A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, and more (formerly allml)"
arch=('any')
license=('GPL')
depends=('vim')
url='http://www.vim.org/scripts/script.php?script_id=1896'
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=12338")
md5sums=('b03b77a1f987d1476b8a9c9bd27cccb6')
install=install

      package() {
	      install -d $pkgdir/usr/share/vim/vimfiles
	      cp -a {doc,plugin} \
		      $pkgdir/usr/share/vim/vimfiles/
	    }
