# Maintainer: Guten Ye

pkgname="keepass-plugin-favicon"
_pkgname="keepass-favicon"
pkgver=1.9.0
pkgrel=1
pkgdesc="A KeePass plugin that downloads and stores favicons. PKGBUILD source code at https://github.com/GutenYe/aur/tree/master/$pkgname"
arch=("any")
url="https://sourceforge.net/projects/keepass-favicon/"
license=("GPLv2")
depends=("keepass")
conflicts=("keepass-favicon")
source=("KeePassFaviconDownloader.plgx::http://downloads.sourceforge.net/project/$_pkgname/$pkgver/KeePassFaviconDownloader.plgx")
_watch=("http://sourceforge.net/projects/keepass-favicon/files/" "files/([-.\d]+)/$")
md5sums=('7b9bbc3196a31213403e2d0eafb1ef0a')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/keepass/plugins"
  cp KeePassFaviconDownloader.plgx "$pkgdir/usr/share/keepass/plugins"
}

# vim:set ts=2 sw=2 et:
