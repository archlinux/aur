# Maintainer: Christopher Scott <christopher.scott@mckean.co>

pkgname=tag-ag
pkgver=v1.4.0
pkgrel=1
pkgdesc='tag: Instantly jump to your ag matches (Precompiled binary from official repository)'
arch=('i686' 'x86_64')
url='https://github.com/aykamko/tag'
license=('MIT') # https://github.com/aykamko/tag/blob/master/LICENSE
optdepends=('the_silver_searcher>=0.25'
            'ripgrep')
options=('!strip' '!emptydirs')
provides=('tag')
source_i686=("https://github.com/aykamko/tag/releases/download/$pkgver/tag_linux_386.tar.gz")
source_x86_64=("https://github.com/aykamko/tag/releases/download/$pkgver/tag_linux_amd64.tar.gz")
md5sums_i686=('9c05463a7939db7f13be36e02951aa49')
md5sums_x86_64=('665dbe367a39303c9140252163bbc148')

package() {
  install -Dm755 "tag" "$pkgdir/usr/bin/tag"
}
