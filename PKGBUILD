# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Maintainer: max-k <max-k@post.com>

prjname=DeeFuzzer
pkgname=deefuzzer
pkgver=0.7.1
pkgrel=1
pkgdesc='Easy and instant media streaming tool'
arch=('any')
url='http://pypi.python.org/pypi/DeeFuzzer/'
license=('custom:CeCILL')
depends=('python2-distribute' 'python2-shout' 'mutagen' 'python-pycurl')
optdepends=('python2-twitter' 'python-tinyurl' 'python-pyliblo')
source=("http://pypi.python.org/packages/source/D/$prjname/$prjname-$pkgver.tar.gz")
md5sums=('59ed358457028e0e9de25ebc1a59258e')

package() {
  cd $prjname-$pkgver
  python2 setup.py install --root="$pkgdir"

  # setup license
  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
