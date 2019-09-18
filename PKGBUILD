# Maintainer: Juan Tascon <juan .at. horlux .dot. org>
pkgname=wtfutil-bin
pkgver=0.22.0
pkgrel=2
pkgdesc="Personal information dashboard for your terminal"
arch=(x86_64)
url="https://wtfutil.com"
license=(MIT)
conflicts=(wtfutil)
source_x86_64=("https://github.com/wtfutil/wtf/releases/download/v${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('73d9761f34d6b5c157bf16a11442176f03d9e1fd7595923042d87a47a2fcd53f')

package(){
  install -D "${srcdir}/wtf_${pkgver}_linux_amd64/wtfutil" "${pkgdir}/usr/bin/wtfutil"
}
