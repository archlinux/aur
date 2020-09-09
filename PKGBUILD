# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.1
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
b2sums=('a0af8decd6a837c148a8c5cc1b12a5912cfdbcdc60b4f786ca63f35aa6121679f80925448bd19b3886a89a10d887c6e514f0ba6d7ae22bfa36388167be025def')
