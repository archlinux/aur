# Maintainer: raf <raf at raf dot org>
pkgname=textmail
pkgver=1.1.1
pkgrel=2
pkgdesc="Mail filter to replace MS Word/HTML attachments with plain text"
arch=("any")
url=https://raf.org/textmail/
license=("GPL")
depends=("perl>=5.14" docx2txt antiword catdoc python-xlsx2csv perl-xls2csv python-pdftotext lynx)
source=("https://github.com/raforg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("dc6c373ed7060de16cdcfb7d5356ca3ca028a8346e70338be63931921184257f")

package()
{
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir"/usr MANDIR="$pkgdir"/usr/share/man/man1 install
}

