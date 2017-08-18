# Maintainer: Silvio Ankermann <silvio at booq dot org>

pkgname=git-annex-remote-gdrive
pkgver=0.6.1
pkgrel=1
pkgdesc='A git-annex special remote for Google Drive'
arch=('any')
url='https://github.com/Lykos153/git-annex-remote-gdrive'
license=('GPL3')
depends=('git-annex' 'gdrive=2.1.0' 'bash')
source=("https://github.com/Lykos153/git-annex-remote-gdrive/archive/v${pkgver}.tar.gz")
sha512sums=('a7caa2b5eda0ff88ca973ebfc3d738f8a0a8102000a385a8d36da5f8be2ac9df1a3914312516e32aea6b749a99a52514a8c734f5ea63daf6f8f7162a51eaf5fb')

package() {
    cd "${pkgname}-${pkgver}"
    install -m 755 -D "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
