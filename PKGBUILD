# Maintainer: Super Bo <supernbo@gmail.com>
pkgname=otf-fira-code-mozilla
pkgver=3.206
pkgrel=1
pkgdesc="Fira Code (Mozilla version) is Fira Mono with less Line Space (1.0) – does not include programming ligatures"
arch=(any)
url='https://github.com/carrois/Fira'
license=("custom: SIL Open Font License")
depends=('fontconfig' 'xorg-font-utils')
conflicts=('otf-fira-code' 'otf-fira-code-git')
install=$pkgname.install
source=(
    "https://github.com/carrois/Fira/raw/master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/FiraCode-Bold.otf"
    "https://github.com/carrois/Fira/raw/master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/FiraCode-Medium.otf"
    "https://github.com/carrois/Fira/raw/master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/FiraCode-Regular.otf")
md5sums=('a89d8ffe48e285a4efce31792e17240e'
         '10afd3e2c9f919056e200976bb03183d'
         '27f24a47e75845269ffe3b2179302989')

package() {
    install -Dm644 "${srcdir}/FiraCode-Bold.otf" "${pkgdir}/usr/share/fonts/OTF/FiraCode-Bold.otf"
    install -Dm644 "${srcdir}/FiraCode-Medium.otf" "${pkgdir}/usr/share/fonts/OTF/FiraCode-Medium.otf"
    install -Dm644 "${srcdir}/FiraCode-Regular.otf" "${pkgdir}/usr/share/fonts/OTF/FiraCode-Regular.otf"
}
