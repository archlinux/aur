# Maintainer: luckdragon <f41c0r [/at\] cyb3r DOT space>

pkgname=imgur-album-downloader-git
_appname=imgur-album-downloader
pkgver=0.0.1.git
pkgrel=1
pkgdesc="Script to download albums off imgur on the command line."
license=('MIT')
url="https://github.com/alexgisby/imgur-album-downloader"
arch=('any')
groups=()
depends=('python')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/alexgisby/imgur-album-downloader.git')
sha1sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

  install -m644 ${srcdir}/${_appname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  cd ${srcdir}/${_appname}
	install -D -m 755 ${srcdir}/${_appname}/imguralbum.py ${pkgdir}/usr/bin/${_appname}
}

# vim:set ts=2 sw=2 et:
