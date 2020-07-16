# Maintainer: Michael Bleuez <michael.bleuez2 at gmail dot com>

pkgname='auto-ytdl-git'
pkgdesc='aytdl, a youtube-dl wrapper with automatisation features for music.'
pkgver=1.0.0
pkgrel=1
arch=('any')
url='https://github.com/michaelb/auto-ytdl'
license=('GPL3')
depends=('ffmpeg' 'youtube-dl')
makedepends=('python-setuptools' 'git')

md5sums=('SKIP')
source=('auto-ytdl::git+http://github.com/michaelb/auto-ytdl.git')

package() {
  cd "${srcdir}/auto-ytdl"
  python -m setuptools.launch setup.py install --root="$pkgdir/" --optimize=1
}
