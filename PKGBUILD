# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.0.7
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64')
url="https://wtfutil.com"
license=('MIT')
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/v${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('6bd004156a578940bc6edf1f68fffa1ca927c5c61ed1c683d9f2afcb5e6271bf')

package(){
  install -D "${srcdir}/wtf" "${pkgdir}/usr/bin/wtfutil"
}
