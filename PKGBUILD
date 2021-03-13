# Maintainer: somini <dev@somini.xyz>
pkgname=tsar
pkgver=1.2
pkgrel=1
pkgdesc='tsar: Tarsnap Always Rotating'
arch=('any')
# This is a fork with extra features
# Upstream: https://github.com/mwgg/tsar
url='https://support.powertools-tech.com/safonso/tsar'
license=('GPL3')
depends=('tarsnap')
source=("https://support.powertools-tech.com/safonso/tsar/-/archive/v${pkgver}/tsar-v${pkgver}.tar.gz")
sha256sums=('68fa18ac7ef833ba7fb2484d3b9ae8f533bdec9ccc273a02bc4fa05bf3105a1a')

package()
{
	cd "$srcdir/${pkgname}-v${pkgver}"
	install -D -m755 tsar.sh "$pkgdir/usr/bin/tsar"
	install -D -m755 rasputin.sh "$pkgdir/usr/bin/rasputin"
	install -D -m755 lsdate.sh "$pkgdir/usr/bin/tsar-lsdate"
}
