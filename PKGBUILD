# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
pkgver=5.1.0.45
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64" "i386")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'  'liblockfile'  'dtkwidget')
source_x86_64=("https://community-packages.deepin.com/deepin/pool/main/d/deepin-mail/deepin-mail_${pkgver}-1_amd64.deb")
source_i386=("https://community-packages.deepin.com/deepin/pool/main/d/deepin-mail/deepin-mail_${pkgver}-1_i386.deb")
sha512sums_x86_64=(
    '642a2e41883489f6606bdc3801e1f1419c928884994bad0e438e730fe58cde2ef2cf0b72c2f5b34835b586ac8ba8c7ec44743871ebb7e266159b20a14a390978'
)
sha512sums_i386=(
    '32b7e2f715aaff3ca0259fc01807e6ae9a44b1452078ff834a4579cee4a166b7492beeb7ca9397ad18d925d3521c0af1a6cc833ff41f53028888e1da6abedc7a'
)

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
}
