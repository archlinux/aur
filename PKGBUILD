# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=nemo-meld-compare
pkgver=1.0
pkgrel=1
pkgdesc="Compare Actions using Meld for Nemo File Manager"
arch=('any')
url="https://wiki.archlinux.org/index.php/Nemo#Nemo_Actions"
license=('GPL')
optdepends=('nemo' 'meld')
source=("compare-save-for-later.nemo_action"
        "compare-with-saved.nemo_action"
		"compare.sh")
sha256sums=('49bb1ecff662decfac104e174a85d1be'
         '0dfab1f68b43ee69a32d47c6a71aae31'
         'e84d427afe91596729519f83ed1b723e')

package() {
	install -Dm755 compare-save-for-later.nemo_action "$pkgdir/usr/share/nemo/actions/compare-save-for-later.nemo_action"
	install -Dm755 compare-with-saved.nemo_action "$pkgdir/usr/share/nemo/actions/compare-with-saved.nemo_action"
	install -Dm755 compare.sh "$pkgdir/usr/share/nemo/actions/compare.sh"
}
