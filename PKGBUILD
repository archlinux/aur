# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=weechat-autosort
pkgver=3.8
pkgrel=1
pkgdesc='A WeeChat plugin: Automatically keep your buffers sorted.'
url='https://github.com/de-vri-es/weechat-autosort'
arch=('any')
license=('MIT')
depends=('python' 'weechat')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/de-vri-es/weechat-autosort/archive/${pkgver}.tar.gz")
sha512sums=('7cfb4108657aae8c2cb30c8c20a30393c0679cea1ea451ec6d1f5cc4b6594c15bbb5eda243a726c745a1f2c488c3343048fc1b7297e9107d3270db7e3aba03a0')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 autosort.py "${pkgdir}/usr/lib/weechat/python/autosort.py"
}
