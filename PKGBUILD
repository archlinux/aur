# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.1.1
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
b2sums=('f0b288721b2f2603a2e22d06dc8eb4534bdbed28b5a99466e086fffdc1b1840996ee35af7e2332e0667e2d75958e2047cd6686e0c060598c361a82b73d6f61b2')
