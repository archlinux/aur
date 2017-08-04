# Maintainer: Roshless <aur@roshless.com>
pkgname=yt-rss-watcher
pkgver=1.1
pkgrel=1
pkgdesc="Automation tool for listening to music on youtube"
arch=('any')
url="https://git.roshless.me/Roshless/yt-rss-watcher"
license=('GPL')
depends=('python' 'youtube-dl' 'mpv' 'python-feedparser' 'python-arrow')
source=(${pkgname}-${pkgver}.tar.gz::https://git.roshless.me/Roshless/yt-rss-watcher/archive/${pkgver}.tar.gz)                                                          
sha256sums=('7e88302f9d0045050976f7134d5d11b35e7a438f9816ae566ffd3f16d11179d5')

package() {
  cd "${srcdir}/${pkgname}"
  echo "${pkgdir}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
