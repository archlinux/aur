# Maintainer: montag451 <montag451 [at] laposte (dot) net>
# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=git-annex-remote-rclone
pkgver=0.7
pkgrel=1
pkgdesc='A git-annex special remote using rclone'
arch=('any')
url='https://github.com/DanielDent/git-annex-remote-rclone'
license=('GPL3')
depends=('git-annex' 'rclone>=1.29' 'bash')
source=("https://github.com/DanielDent/git-annex-remote-rclone/archive/v${pkgver}.tar.gz")
sha512sums=('ffde4cb584e94dc42c966694662c297aae7bcfa3d4b1f250c0b46231edcd20ef3bfecf3bf0283375e667a232b0d1a64acfdf52574356c0487ffc1e844368645e')

package() {
    cd "${pkgname}-${pkgver}"
    install -m 755 -D "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
