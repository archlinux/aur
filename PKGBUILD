# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.3
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
sha256sums=('f062e41ba17b422c7f6a1a0d89087215c2a7b280dbe396cd828dd43959063f4d')
b2sums=('ee79b037e9b1cd32d32118f1b1f63be8777ee72d579723fda5aea9fef0a8973d66c4660d1a2f08603c2ee385f520a1c9a006982570962b4e37e0987f806a3d87')
