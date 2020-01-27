# Maintainer: Kazuki Przyborowski <kazukiprzyborowski[at]gmail[dot]com>
pkgname=python2-pycatfile
pkgver=0.0.1
pkgdate=20180329
pkgrel=1
pkgdesc="A tar like file format name catfile after unix cat command (concatenate files)."
arch=('any')
url="https://github.com/GameMaker2k/PyCatFile/"
license=('BSD')
replaces=('python2-catfile' 'python2-pycatfile')
depends=('python2')
options=(!strip !emptydirs)
_gitrevision='4a37501111a7745f2152036b9867bd63a9322d5e'
source=("https://github.com/GameMaker2k/PyCatFile/archive/${pkgdate}.tar.gz")
md5sums=('8bdae03258ed29c87057d79c72f4a9ff')
sha224sums=('658adaa1f280e58043d5ae2559eb9c08b6c622575b1ef666817a5e99')
sha256sums=('32e315d7fdcadb3a7e801ef85b8190b70efcf1d2418ec1d60eb005676dfc1fde')
sha384sums=('76bf405f3be3ac4e6b538db7d0790cbf750a682d5b8d061db2dd01ba60f5441669bed3e2a3bbb415ab688525bdec90dd')
sha512sums=('30a3bbf27c293af6e1fc58cbdc57ea6c18819532973c1ffe805768b350f73268720568081999bb3a615bbefeff8e4f86aeb16b785860ce7b9abe6a9f22c30ac6')
b2sums=('fd3a193b5c06696722ecce3a5e0c382406068914c799a6693bfe8b3bd64df3e0e5e8075792be51c2fbcf5bfbcb392a83fb9ff73e26e96060ce1a6b20de430e90')

package() {
  cd "${srcdir}/PyCatFile-${_gitrevision}"
  /usr/bin/python2 ./setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
