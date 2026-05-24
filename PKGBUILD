# Maintainer: Méven Car <meven@kde.org>
 
pkgname=keychron-q1-he-udev
pkgver=1.0.1
pkgrel=1
pkgdesc='udev rule for the Keychron Q1 HE wireless keyboard'
arch=('any')
depends=('keychron-link-udev')
license=('0BSD')
source=('70-keychron-q1-he.rules')
sha256sums=('d0479d4c58518a8bccc9915bdd2e96da4302a71a9dd5ea096b06cee6babac222')

package() {
	install -Dm644 70-keychron-q1-he.rules "$pkgdir/usr/lib/udev/rules.d/70-keychron-q1-he.rules"
}
