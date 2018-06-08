# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.0.6
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64')
url="https://wtfutil.com"
license=('MIT')
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/v${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('1f9e3c92ddb81f98df2b0854c5f935a6ebdad1271378ba345f8ebf756c143cb2')

package(){
  install -D "${srcdir}/wtf" "${pkgdir}/usr/bin/wtfutil"
}
