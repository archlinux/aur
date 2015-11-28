# Maintainer: dryes <joswiseman@cock.li>
pkgname='nzbjoin-git'
pkgver=2
pkgrel=1
pkgdesc='takes multiple nzb input files and merges them together.'
url='https://github.com/dryes/nzbjoin'
arch=('any')
license=('MIT')
depends=('python2' 'python2-pynzb')
makedepends=('git')
source=('git://github.com/dryes/nzbjoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  install -D -m755 "${srcdir}/nzbjoin/nzbjoin.py" "${pkgdir}/usr/bin/nzbjoin"
}
