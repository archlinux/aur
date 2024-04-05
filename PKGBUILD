# Maintainer: SlamZDank <slamndank2 at topG(gmail) dot com>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: Icelk <main at icelk.dev>
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrother(gmail) dot com>
# Original Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=vscodium-insiders-bin-marketplace
pkgver=1.73.5
pkgrel=3
pkgdesc='Enable VsCode marketplace in vscodium-insiders-bin.'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium-insiders-bin' 'sed')
install="${pkgname}.install"
conflicts=('vscodium-insiders-marketplace')
source=('vscodium-insiders-bin-marketplace.hook'
        'patch.sh')
sha512sums=('e9bfe0806a705b140b448ad142b7992fff21ff7eb50a0c7c91ddb654d8be1c1ad510eb1ad33abc0386c21162c6eb575d710afb106940d3d513cc4df2829e14fa'
            '32ff84a854118349823d2647e2b26596740f76fd84cda2e982fad07583582f1f9e62353ee7c55f37fab151de6103544626fa4b2f5e92461cb33fc56d203aded9')
package() {
  install -Dm 644 "${srcdir}"/vscodium-insiders-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-insiders-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/vscodium-insiders-bin/resources/app/patch.sh
}

