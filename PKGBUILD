# Maintainer: Dany Marcoux <danymarcoux+archlinux@gmail.com>

pkgname=tag-ag
pkgver=1.2.1
pkgrel=3
pkgdesc='tag: Instantly jump to your ag matches (Precompiled binary from official repository)'
arch=('i686' 'x86_64')
url='https://github.com/aykamko/tag'
license=('MIT') # https://github.com/aykamko/tag/blob/master/LICENSE
depends=('the_silver_searcher>=0.25')
options=('!strip' '!emptydirs')
provides=('tag')
source_i686=("https://github.com/aykamko/tag/releases/download/$pkgver/tag_linux_386.tar.gz")
source_x86_64=("https://github.com/aykamko/tag/releases/download/$pkgver/tag_linux_amd64.tar.gz")
md5sums_i686=('1c987fda22316cc93a8f6a697ac1e694')
md5sums_x86_64=('b931c6f7d751ea0c76cee8bd226122cd')

package() {
  install -Dm755 "tag" "$pkgdir/usr/bin/tag"
}
