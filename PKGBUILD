# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
license=('AGPL3')
options=('!lto')
pkgdesc='A static and dynamic online form generator'
pkgname=zeroform-bin
pkgrel=1
pkgver=0.8.0
sha256sums_x86_64=('98c0c0fe4704673199b004f386de99bc7b5daf0eb24fb2834eb4d84a6b2ea769')
url='https://simonrepp.com/zeroform'

source_x86_64=("https://simonrepp.com/zeroform/packages/zeroform_${pkgver}-1+deb11_amd64.deb")

package() {
	tar -xvf data.tar.xz -C "${pkgdir}"
}
