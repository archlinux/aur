# Maintainer: Michael Bleuez <michael.bleuez2 at gmail dot com>

pkgname='auto-ytdl-git'
pkgdesc='A youtube-dl wrapper with automatisation features. Run from terminal: aytdl'
pkgver=1.0.2
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
