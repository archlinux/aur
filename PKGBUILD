# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A command line utility to merge, split and chapterize audiobook files such as mp3, ogg, flac, m4a or m4b'
pkgname=('m4b-tool-bin')
pkgver=0.4.2
pkgrel=1
arch=('x86_64')
license=('MIT')
url="https://github.com/sandreas/m4b-tool"
makedepends=()
depends=('ffmpeg'
    'libmp4v2'
    'php'
    'php-intl')
optdepends=('fdkaac: for high efficiency codecs to perform conversions')
options=('!strip')
source=("m4b-tool.tar.gz::https://github.com/sandreas/m4b-tool/releases/download/v.${pkgver}/m4b-tool.tar.gz")


package() {
    cd ${srcdir}
	install -Dm 755 m4b-tool.phar "${pkgdir}/usr/bin/m4b-tool"
}
md5sums=('60746a96431c068f6880ebf510e2bac7')
sha256sums=('0ec79733770379dbd11ea9d76fd03d62d8aacca8e66730779f7caaa92f577ba7')
