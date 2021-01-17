# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.2
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
sha256sums=('42d184ce855026038988f88c0fb3d4011565a9f423fea9988b1eeba054f8b199')
b2sums=('95789885e48103e02d87495dfa3e7ddc1f77921fb464995ab0905209e1d3bb5c3dd611ac4fd40f0bc3489607e9dfda98d66df6540a7abecb83cc264a0697b9d0')
