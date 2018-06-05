# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.0.5
pkgrel=2
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64')
url="https://wtfutil.com"
license=('MIT')
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/v${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('e79e1b0250e0f345bb5539a011a51dbad162d0422e8a97267a3219340aed0e5b')

package(){
  install -D "${srcdir}/wtf" "${pkgdir}/usr/bin/wtfutil"
}
