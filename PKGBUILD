# Contributor: Storm Dragon <stormdragon2976@gmail.com>
pkgname=sndup-linux-git
pkgver=2
pkgrel=2
pkgdesc="A client to upload audio files to the sndup.net autdio sharing service."
arch=('any')
url="http://github.com/stormdragon2976/sndup-linux"
license=('WTFPL')
depends=('bash' 'curl')
makedepends=('git')
optdepends=('yad: for a GUI'
'fbcmd: Post url to Facebook'
'texapp: Post url to App.net'
'ttytter: Post url to Twitter'
'xclip: Automatically copy links to the clipboard')

_gitroot="git://github.com/stormdragon2976/sndup-linux.git"
_gitname="sndup-linux"
source=(git://github.com/stormdragon2976/sndup-linux.git)
md5sums=('SKIP')

package()
 {
  msg "Starting to build the package..."

  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/bin"
install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -m755 "sndup" "$pkgdir/usr/bin"
  install -m666 "license.txt" "$pkgdir/usr/share/licenses/${pkgname}"
  }

