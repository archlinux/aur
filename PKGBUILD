# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.10.7
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kopia/kopia/'
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("app-update.yml")
source_x86_64=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_armv7l.deb")
sha256sums=('6e04ed70f54a3d70c22240cd6e4f65df4ad2f3e8aa1608aca20dc91c594bd83b')
sha256sums_x86_64=('443414855e4c341ddbe21d7120a68854f344133d85645c9d53618b294c11d5eb')
sha256sums_aarch64=('16cf8540e21b23d93311408b7e320a18cc44e956d5218e846cb641659c224667')
sha256sums_armv7h=('e2399620e260a37fdd0a6b3d9ca0bc950cdac05cc568bfdb24cde7e596815c99')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    cp app-update.yml "$pkgdir/opt/KopiaUI/resources"
}
