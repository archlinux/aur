# Maintainer: montag451 <montag451 [at] laposte (dot) net>

pkgname=git-annex-remote-rclone
pkgver=0.6
pkgrel=4
pkgdesc='A git-annex special remote using rclone'
arch=('any')
url='https://github.com/DanielDent/git-annex-remote-rclone'
license=('GPL3')
depends=('git-annex' 'rclone>=1.29' 'rclone<=1.40' 'bash')
source=("https://github.com/DanielDent/git-annex-remote-rclone/archive/v${pkgver}.tar.gz")
sha512sums=('79413d5e59f17989ebd3b43428b6c930efe784c25673dbe71f835162f18188fc2ef8af98aa6fa1bbcc6e27b2770689ca0761733a22be1276369d3e8cf833bb6e')

package() {
    cd "${pkgname}-${pkgver}"
    install -m 755 -D "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
