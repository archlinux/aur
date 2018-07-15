# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.0.11
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64')
url="https://wtfutil.com"
license=('MIT')
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('da31108acaeadc56b181dd37706a7aeff9a9bb6b17bf15420b81e1b690db7b05')

package(){
  install -D "${srcdir}/wtf_${pkgver}_linux_amd64/wtf" "${pkgdir}/usr/bin/wtfutil"
}
