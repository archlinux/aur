# Maintainer: Guilherme B. Duarte <guilhermebemberduarte@gmail.com>

pkgname=openasar-bin
_pkgname=OpenAsar
pkgver=nightly
pkgrel=2
epoch=1
pkgdesc="Open-source alternative of Discord desktop's app.asar, needs Discord installed"
arch=('x86_64')
url="https://openasar.dev/"
license=('MIT')
depends=('unzip')
optdepends=('discord: Stable channel Discord'
            'discord-canary: Canary channel Discord'
            'discord-development: Development channel Discord')
conflicts=('discord_arch_electron'
           'discord-canary-electron-bin')
source=("https://github.com/GooseMod/$_pkgname/releases/download/$pkgver/app.asar"
        "openasar-install.hook"
        "openasar-install.sh"
        "openasar-remove.hook"
        "openasar-remove.sh"
        "openasar-update.hook"
        "openasar-canary.hook"
        "openasar-development.hook"
        "openasar-stable.hook"
        "openasar-delete.sh")
sha512sums=('9a6760f3f4bdb65b2efdc9ae5513899c0e4188ad827199d33ff45bd650a745540f322ff95813fba7a236316c74b2de14f60e4bda58ba01bc07c41cb6d0180f34'
            '8044bb6822e56c82005418a8df4ed1c13e15c4bfe6af1cf55674401ec82be380f6405cbeafe83d269021c0911c09fb243f41836353cc49be42e2b4e6647df3fc'
            '21d2b91c582091ab1ce69bc8dedd49727b36f17f07c892480963e6d98e95e9a61f8c2dc7670992d4721c23a428e211affbb5ad37f80ddb064cb9bd2d51617a86'
            '6702f6ba99197260ee0ecf38229a0989a8fa439c8afe9e75548bfe01bc2ab0e010b1e72eb0a8a3af265d122c62243ec2a6b5ad0fcdab3fc3a8b3777150fa72a4'
            '50a4029a0b5f6a576fa0a203627abb13a6e0ade1ef6a718805386b95fea7957d4f572bce481084f93fd5f097f7785d867c4d79be4b83c71ea0164e53f082d881'
            'da5982e3ed2c867927e6d7d962ceae687a29eadc251fe43fa7fc796259a1b5fcdb302e6e1e33b1de53304c81e3e4f57d1fabda3d2470640a995b147895f59004'
            'da43ebfc6900a547b74d51f9035cc6ab80d0a1eefd9257a7036a11765771246bcc528e5c50c8d1e2aa4f1a06fcc641c2111004aba311d38c9bad21855064c951'
            '5094de305fbf70f2a79e88b0dd0ee55a85a23c333da7b681b0262896a5503a7b7b7c7bb0b52d9be60003e78a3b33b88c3e586ecc0d450c64dbc90d460efd2323'
            '3ca8d2adad92dc01e98bb8c0fa1216d946a661274bc30a5ae639f903c7d489bb7bee83db3cd0d8d79bfd31e58c1c608998b566c7d069323ed6c95483522c0d89'
            '06fdb8c0b3d4a1b7a25d492b5475f04240321ddcb4c1b6bd7195b40be7a049295f5727d8c6432c3d140822a01640399e9bb8bbfd5e7b076af97be54d08060a36')

package() {
install -Dm 644 app.asar "$pkgdir"/usr/share/openasar/app.asar
install -Dm 644 openasar-install.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-install.hook
install -Dm 744 openasar-install.sh "$pkgdir"/usr/share/openasar/openasar-install.sh
install -Dm 644 openasar-remove.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-remove.hook
install -Dm 744 openasar-remove.sh "$pkgdir"/usr/share/openasar/openasar-remove.sh
install -Dm 644 openasar-update.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-update.hook
install -Dm 644 openasar-canary.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-canary.hook
install -Dm 644 openasar-development.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-development.hook
install -Dm 644 openasar-stable.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-stable.hook
install -Dm 744 openasar-delete.sh "$pkgdir"/usr/share/openasar/openasar-delete.sh
}
