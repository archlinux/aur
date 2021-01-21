# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=weechat-autosort
pkgver=3.6
pkgrel=1
pkgdesc='A WeeChat plugin: Automatically keep your buffers sorted.'
url='https://github.com/de-vri-es/weechat-autosort'
arch=('any')
license=('MIT')
depends=('python' 'weechat')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/de-vri-es/weechat-autosort/archive/${pkgver}.tar.gz")
sha512sums=('3c47e090c43a6e215b5552a0c87287c465d923668738dc653b6996c502fbff42ce7f66f8bd26cbe5f91e1bce2fea954ba1faa9c2acd59f7c1b0c35c9c522fdcb')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 autosort.py "${pkgdir}/usr/lib/weechat/python/autosort.py"
}
