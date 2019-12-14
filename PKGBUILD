# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=nemo-meld-compare
pkgver=1.0
pkgrel=1
pkgdesc="Compare Actions using Meld for Nemo File Manager"
arch=('any')
url="https://wiki.archlinux.org/index.php/Nemo#Nemo_Actions"
license=('GPL')
depends=('nemo' 'meld')
source=("compare-save-for-later.nemo_action"
        "compare-with-saved.nemo_action"
		"compare.sh")
sha256sums=('157a7ecc53ef1d011bb72b3e83424c9270a9dc3422fde9c603806c763eee9c73'
            'bd2eb1e894ab052d4f65b091f39aea7659c6c820f78a7ddbaff7bc27cf9afd55'
            '0ce8c27b9003008e6d371f9cddad8a343088f0f2e095830b168cb74d4dd7b439')

package() {
	install -Dm755 "$srcdir/"* -t "$pkgdir/usr/share/nemo/actions"
}
