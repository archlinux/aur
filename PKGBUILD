# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-bin
pkgver=50200.1.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn-bin')
conflicts=('matterhorn' 'matterhorn-git')
depends=('gmp' 'libffi' 'ncurses5-compat-libs' 'zlib')
source=("https://github.com/matterhorn-chat/matterhorn/releases/download/${pkgver}/matterhorn-${pkgver}-ubuntu-x86_64.tar.bz2"
        "LICENSE::https://github.com/matterhorn-chat/matterhorn/raw/master/LICENSE")
sha1sums=('22aff96508ce3d2a8aac507a9580b630b937ee1f'
          '42e13363365a1fed1318f9e7fadd8d1760e7ba95')

package() {
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd ${srcdir}/matterhorn-${pkgver}-Ubuntu-${arch}
  install -m755 -D matterhorn ${pkgdir}/usr/bin/matterhorn

}
