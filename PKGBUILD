# $Id$
# Maintainer : Sergey Kostyaev <feo.me@ya.ru>

pkgname=uqm-hd-sound
pkgver=0.2
pkgrel=1
pkgdesc="The Ur-Quan Masters HD music and voices"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/urquanmastershd/"
license=('GPLv2')
source=(https://downloads.sourceforge.net/project/urquanmastershd/Beta%201/debs/uqm-hd-3dovoice_${pkgver}-${pkgrel}_all.deb
        https://downloads.sourceforge.net/project/urquanmastershd/Beta%201/debs/uqm-hd-3domusic_${pkgver}-${pkgrel}_all.deb
       )
md5sums=('5aad9bc2b0f79ac8916299dd29ff9e40'
         'ac2841b3cb6d634888f3a7078606d9fa')
noextract=(uqm-hd-3dovoice_${pkgver}-${pkgrel}_all.deb
           uqm-hd-3domusic_${pkgver}-${pkgrel}_all.deb)

package() {
  ar p $srcdir/uqm-hd-3dovoice_${pkgver}-${pkgrel}_all.deb data.tar.gz | tar zx --one-top-level=$pkgdir
  ar p $srcdir/uqm-hd-3domusic_${pkgver}-${pkgrel}_all.deb data.tar.gz | tar zx --one-top-level=$pkgdir
}
