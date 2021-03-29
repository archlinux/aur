# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.4
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
sha256sums=('1b7ea8239c2aa545a1ae4881d7508be12f82e2f1925d97425c635296289dc900')
b2sums=('657306cffa545ad923aaeeb663836af51698e4df4c7b6c69e9de5af9f82a3001ba696f6d0142732525a857e03a6345ef84de9afa46eda88380b2bd5b5e811ca3')
