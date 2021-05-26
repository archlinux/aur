# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.7.1
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
sha256sums=('5e81781763a24ba3b1484741599bbfe0c42354fed6083d19e74b2bb551921376')
b2sums=('dea97fb89119c110e7ff951332e9e3cdebd54a270b4fa4813878f01cb0fff6adc1486836db2faaacb2eb8b164fc862c6aa429b800dc51faa225f935c444aee1d')
