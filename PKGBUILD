# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=gasher
pkgname=gasher-git
pkgver=0
pkgrel=2
pkgdesc="A GNU Social client written in bash."
arch=('any')
url="https://github.com/stormdragon2976/gasher"
license=('unlicense')
depends=('bash' 'curl')
makedepends=('git')
optdepends=('sox: soundclip support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/stormdragon2976/$_pkgname.git")
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
