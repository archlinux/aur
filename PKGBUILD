# Maintainer: Kai Yamada <gpioblink@gmail.com>

pkgname=track
pkgver=1.0.6
pkgrel=1
pkgdesc='track CLI: Allow local IDE usage during the exam on track'
arch=('any')
url='https://tracks.run/'
license=('custom')

source=('https://s3-ap-northeast-1.amazonaws.com/track-cli/downloads/linux_x86_64/track.zip')
sha256sums=('c861c02cf61bc86bb0d0646775be6280fbf69c57c2f35a234d82383f4698f33e')

package() {
    cd ${srcdir}
    install -Dm755 track "${pkgdir}/usr/bin/track"
}