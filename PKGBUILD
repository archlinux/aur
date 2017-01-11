pkgname=fahclient
pkgver=7.4.4
_shortver=7.4
_fullver=7.4.4-1
pkgrel=2
pkgdesc='A command line client for Folding@Home'
url="http://folding.stanford.edu/English/HomePage"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('zlib')
source=('fahclient.service')
source_i686=("https://folding.stanford.edu/releases/public/release/$pkgname/centos-5.5-32bit/v${_shortver}/$pkgname-${_fullver}.i686.rpm")
source_x86_64=("https://folding.stanford.edu/releases/public/release/$pkgname/centos-5.3-64bit/v${_shortver}/$pkgname-${_fullver}.x86_64.rpm")

sha256sums=('b5cd088c7385e9387aab3fd216abbec4095978d4c3f10e874db022fa21a47ec3')
sha256sums_i686=('55d1b39d5e2f4acd9d81b327ebe6f0b28b55e99676796a4fac14aee661b9a20e')
sha256sums_x86_64=('e189caecc0afea55c621c06fa0bcd43a5924d92e53b3b19126bbc1b24d29188e')

package() 
{
  install -Dm755 "$srcdir/usr/bin/FAHClient" "$pkgdir/usr/bin/FAHClient"
  install -Dm755 "$srcdir/usr/bin/FAHCoreWrapper" "$pkgdir/usr/bin/FAHCoreWrapper"
  install -Dm644 "$srcdir/fahclient.service" "$pkgdir/usr/lib/systemd/user/fahclient.service" 
}