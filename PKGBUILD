# Maintainer: Silvio Ankermann <silvio at booq dot org>

pkgname=git-annex-remote-gdrive
pkgver=0.6
pkgrel=1
pkgdesc='A git-annex special remote using rclone'
arch=('any')
url='https://github.com/Lykos153/git-annex-remote-gdrive'
license=('GPL3')
depends=('git-annex' 'rclone>=1.29' 'rclone<=1.36' 'bash')
source=("https://github.com/Lykos153/git-annex-remote-gdrive/archive/v${pkgver}.tar.gz")
sha512sums=('be63be0e0619490a019c5cd3638bf0e10f212786ea3588f6b3f6d615d6659672bfbd19b7bfc4c60bf2a3e50dc7053687b378810b57dac1d47f6ec7e844d6fab5')

package() {
    cd "${pkgname}-${pkgver}"
    install -m 755 -D "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
