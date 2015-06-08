# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=gasher
pkgname=gasher-git
pkgver=0
pkgrel=1
pkgdesc="A GNU Social client written in bash."
arch=('any')
url="http://github.com/wmb-solutions/gasher"
license=('GPL3')
depends=('bash' 'curl')
makedepends=('git')
optdepends=('sox: soundclip support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/2mb-solutions/$_pkgname.git")
md5sums=("SKIP")

 pkgver()
{
   cd "$srcdir/$_pkgname"
   echo "0.$(git rev-list --count HEAD).$(git describe --always)"
 }

 package()
 {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  }

# vim:set ts=2 sw=2 et:
