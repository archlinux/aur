# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=otf-some-time-later
pkgver=3.3
pkgrel=1
pkgdesc='Font inspired by the title and time cards in the cartoon SpongeBob SquarePants'
arch=(any)
url='https://github.com/ctrlcctrlv/some-time-later'
license=(OFL-1.1-no-RFN)
source=("${pkgname}-${pkgver}.tgz::https://github.com/ctrlcctrlv/some-time-later/archive/refs/tags/v3.3.tar.gz")
sha512sums=(480e6d82ac97325f798e1a51a083dd7d11393673d3db208428f4c7c55cf2fdfc01ca8d023c7cc76a5f06fcc85df527ff5e4a003f7f52cf23b2979dc65ac6035d)

package() {
	install -Dm644 "${srcdir}/${pkgname#otf-}-${pkgver}/Some Time Later.otf" -t "${pkgdir}/usr/share/fonts/OTF"
	install -Dm644 "${srcdir}/${pkgname#otf-}-${pkgver}/LICENSE.TXT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
