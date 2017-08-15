# Maintainer: Roshless <aur@roshless.com>
pkgname=yt-rss-watcher
pkgver=1.2
pkgrel=1
pkgdesc="Automation tool for listening to music on youtube"
arch=('any')
url="https://git.roshless.me/Roshless/yt-rss-watcher"
license=('GPL')
depends=('python' 'youtube-dl' 'mpv' 'python-feedparser' 'python-arrow')
source=(${pkgname}-${pkgver}.tar.gz::https://git.roshless.me/Roshless/yt-rss-watcher/archive/${pkgver}.tar.gz)                                                          
sha256sums=('d60dbcd7b0501541c1b53a80cf53cba2a67044df27299a02f06884c4d85e8122')

package() {
  cd "${srcdir}/${pkgname}"
  echo "${pkgdir}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
