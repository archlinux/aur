# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.6
pkgrel=1
pkgdesc='Sync content to LBRY using youtube-dl'
arch=('any')
url="https://gitlab.com/$_author/$pkgname"
license=('GPL3')
depends=('jq' 'curl' 'lbrynet' 'youtube-dl')
source=("https://gitlab.com/$_author/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

package() {
   install -Dm755 "${srcdir}/$pkgname-v$pkgver"/lbry-sync-ytdl -t "${pkgdir}/usr/bin/"
}
sha256sums=('c7a177416e47cc2e2614b9a2e91bbca3c224b8dbbe6e1637a6cce045d2d04018')
b2sums=('8d7507e64f1136759b81f86f6749a0c1d2a1fbc245c4e7fea6b128084ddaae5e47b1c422a2e785f3f40e87d3c63fab424862b046b1623a9ea7ac54a136a9bb03')
