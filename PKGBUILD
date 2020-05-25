# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: birdflesh <antkoul at gmail dot com>
# Contributor: Army <uli.armbruster@gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>

pkgname=ttf-ms-fonts
pkgver=2.0
pkgrel=12
pkgdesc='Core TTF Fonts from Microsoft'
arch=('any')
url="http://corefonts.sourceforge.net"
license=('custom:Microsoft')
provides=('ttf-font')
_files=('andale32.exe'
        'arial32.exe'
        'arialb32.exe'
        'comic32.exe'
        'courie32.exe'
        'georgi32.exe'
        'impact32.exe'
        'times32.exe'
        'trebuc32.exe'
        'verdan32.exe'
        'webdin32.exe')
_dlpath="https://downloads.sourceforge.net/project/corefonts/the%20fonts/final"
source=("${_files[@]/#/$_dlpath/}")
sha256sums=('0524fe42951adc3a7eb870e32f0920313c71f170c859b5f770d82b4ee111e970'
            '85297a4d146e9c87ac6f74822734bdee5f4b2a722d7eaa584b7f2cbf76f478f6'
            'a425f0ffb6a1a5ede5b979ed6177f4f4f4fdef6ae7c302a7b7720ef332fec0a8'
            '9c6df3feefde26d4e41d4a4fe5db2a89f9123a772594d7f59afd062625cd204e'
            'bb511d861655dde879ae552eb86b134d6fae67cb58502e6ff73ec5d9151f3384'
            '2c2c7dcda6606ea5cf08918fb7cd3f3359e9e84338dc690013f20cd42e930301'
            '6061ef3b7401d9642f5dfdb5f2b376aa14663f6275e60a51207ad4facf2fccfb'
            'db56595ec6ef5d3de5c24994f001f03b2a13e37cee27bc25c58f6f43e8f807ab'
            '5a690d9bb8510be1b8b4fe49f1f2319651fe51bbe54775ddddd8ef0bd07fdac9'
            'c1cb61255e363166794e47664e2f21af8e3a26cb6346eb8d2ae2fa85dd5aad96'
            '64595b5abc1080fba8610c5c34fab5863408e806aafe84653ca8575bed17d75a')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf *.TTF
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Licen.TXT
}
