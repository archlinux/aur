# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.0.10
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64')
url="https://wtfutil.com"
license=('MIT')
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/v${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('2560cd2d2682a8e0c2b946c55deed7f72154f5839a0829439facdf2104886fdf')

package(){
  install -D "${srcdir}/wtf_${pkgver}_linux_amd64/wtf" "${pkgdir}/usr/bin/wtfutil"
}
