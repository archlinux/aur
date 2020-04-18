# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=gasher
pkgname=gasher-git
pkgver=101.226f4f1
pkgrel=1
pkgdesc="A GNU Social client written in bash."
arch=('any')
url="https:/git.2mb.codes/~lilmike/gasher"
license=('GPL3')
depends=('bash' 'curl')
makedepends=('git')
optdepends=('sox: soundclip recording and playback'
  'mplayer: sound clip playback'
  'mpv: sound clip playback')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://git.2mb.codes/~lilmike/$_pkgname")
md5sums=("SKIP")

 pkgver()
{
   cd "$srcdir/$_pkgname"
   echo "$(git rev-list --count HEAD).$(git describe --always)"
 }

 package()
 {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  }

# vim:set ts=2 sw=2 et:
