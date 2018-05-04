# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/ryanoasis/nerd-fonts

pkgname=nerd-fonts-gabmus
pkgver=2.0.0
pkgrel=2
depends=('fontconfig')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete-mono-glyphs' 'nerd-fonts-complete')
pkgdesc="Selection of nerd-fonts curated by gabmus"
url="https://github.com/ryanoasis/nerd-fonts/"
arch=('any')
license=('MIT')
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/AnonymousPro.zip
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/AnonymousPro.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Cousine.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/DejaVuSansMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/DroidSansMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FiraCode.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FiraMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Hack.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/LiberationMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Meslo.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Monofur.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/RobotoMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/SourceCodePro.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Terminus.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Ubuntu.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/UbuntuMono.zip")
sha512sums=("d507bba17336852468dd99b3b3d0c1d843df6af1dc8e5b747f03f93663532abb7dd1ff2bf46d39f871330375bb7f16fab13b351f7af2948e20daec81371b21f5"
            "0b8bc24892155b6bd9bc9c1c5871bc05e9e53ffddd98313c9f23444cbe7c7b1534ac83a4c8f50b9c9300a016d9a08ca870ca2cd1a4d09ab2736fc6c80a48910d"
            "92f8f0a41774ec78ae4e4addb811ba5cae1f904ee14bf54eb0e64662fa0ee2a1a73220b15e1e83679badd4eaeae0fcc6f8790fd8d5aea89a8957ba79c5136baf"
			"9b89c876a9047a1a5be1e097b63a289d50c3e3d6cf12300875f19389e59e7404db2ef71b84e42cccd4d45cbfe584324506fb474308ac9083f8308d553b1d7071"
            "0e8a2ab74516a3157aad2242844c507b81d67da4022d21e680fb5e42511c4c636df21438f84eabf1214a5ff4485575e3de52a1a023b384d0a6eb31057df5e34a"
            "abfe39ee08c3cb3ae282f802aa7a33af79855f3d1fb6cc619f3774616ca80c2297e84f7f8626dcf3139b3844c77ffdab7d1a9445b19aace1be3d01c0a0d48f23"
            "6dab40eaefb4b95b3d1823a47c417296922873ca377969431ad10a11e347d0ee82524d3c36946ce88dfdb4b144f76b2d6ed996523336f2c1a8658f3a9928efa1"
            "47d7a55a6e3fbd2bd84191c93cc42dc33f7d6736e6186b51067feefee992e8c82c4218c6396b0c8c46046c223ebb18bae787d4a7e249dafd0c625f089ea48ef8"
            "75b3446e5b927da9699edf83165ee8b7440c1f75f53f1dbf96b4c22361a1cace26fc4fb610c89fc5f434013c056828a80a8bac4f7a16d43f71654837d73c14d1"
            "76fb1b0b1404cd5aca90ae7d2febce3103854a09b3e5708dd905cb19c6fc69635d33f6def885dc263e0225ea823e50b3ca43ff8fa44b230eeaf3ad1320298b17"
            "e677d4c91fa2c2f0fa1eadc9c7cb410e4343f27bae7480c80d78e1f5fd88f0f1fd7d685183c531b473b4d59231a5b24c691f33e3d7b950c7d8e5cc91bf7b0003"
            "d9e06bcbee3a5d682be8833850fe777653271f9d16cb73ed06fd61cd9b49919323fa21ade525880f75f5ce948e055e1059d349d7d2d74e4f5f5e1bab0df76cba"
            "5690226c14813ac23e29dcf371a45b0d01e826e4230e483c0733c30e29d191ccc8e758398deb265f544a3ef74c523498c9397b532c4685ba2f193227f1c9ca7a"
            "c8c6868f69744d4c47f4f32067b24473dc167369edf3a9f5b612b2bd237d5ff532a9e7d44d865f46d13a22e7ad27462dd1d147c5c419dea7f2758980de0d4837"
            "3637ce90453b052ca9e2adaadad3927fc0b53c61fa7cdf21b5c6ae437c299a23ce70da42efe7ee989017cd90c9bd08b10f99f452c74750406f943609df3a3e59") 


package() {

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  rm *Windows*.*tf
  install -m644 *Complete*.*tf "${pkgdir}"/usr/share/fonts/"${pkgname}"

}

