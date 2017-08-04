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
sha256sums=('c19b48e58c84ef5dfe75f8b4e063da15820e23aef95b371408ce9fb73d7d1bc5')

package() {
  cd "${srcdir}/${pkgname}"
  echo "${pkgdir}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
