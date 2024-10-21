# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
pkgname=nordzy-hyprcursors
pkgver=2.3.0
pkgrel=2
pkgdesc="Hyprcursors from https://github.com/guillaumeboehm/Nordzy-cursors."
arch=(any)
url="https://github.com/guillaumeboehm/Nordzy-cursors"
license=('GPL3')
source=(
    "Nordzy-hyprcursors_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Nordzy-hyprcursors.tar.gz"
    "Nordzy-hyprcursors-white_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Nordzy-hyprcursors-white.tar.gz"
    "Nordzy-hyprcursors-lefthand_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Nordzy-hyprcursors-lefthand.tar.gz"
    "Nordzy-hyprcursors-white-lefthand_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Nordzy-hyprcursors-white-lefthand.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
    "06566625d81d1446c2a51d39deb526c1be8a5482c8a7d19b1db46f996446a17d"
    "a77d124fc03764260af7f54b916bafa9a8431c2cdcfd49b3f5c760ae02f933bb"
    "f077dda64ea856abef3fb3e69559e2ac10738d2b1576b8209caceb01b4a49588"
    "f547315ab56b97cd84978d1bdd40a9512bd95e4287b28a9fd7f6c469a74f37ff"
)

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-white"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-lefthand"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-white-lefthand"

	tar --no-same-owner -zxvf "Nordzy-hyprcursors_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-white_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-lefthand_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-white-lefthand_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
}
