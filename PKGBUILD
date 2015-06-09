pkgname=libreoffice-extension-perfectepub
_pkgname=PerfectEpub
pkgver=0.0.7
pkgrel=2
pkgdesc="Extension for cleaning formatting errors in LibO files"
arch=('any')
url="http://lukesblog.it/ebooks/ebook-tools/perfectepub/"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime')
source=('http://lukesblog.it/wp-content/plugins/cimy-counter/cc_redirect.php?cc=PerfectEpub&fn=http://dl.dropbox.com/u/14712909/macro/PerfectEpub/PerfectEpub-0.0.7.oxt')
md5sums=('c62ce487234fe927cd2bae3fb653a7f4')

package() {
  mkdir -p "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  cp -R "$srcdir"/* "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  rm "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/$_pkgname-$pkgver.oxt"
}



