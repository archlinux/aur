# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Martin Erik Werner ("arand") <martinerikwerner@gmail.com>

_submodules=("acerspyro"
             "actors"
             "appleflap"
             "blendbrush"
             "caustics"
             "crosshairs"
             "dziq"
             "elyvisions"
             "fonts"
             "freezurbern"
             "john"
             "jojo"
             "jwin"
             "luckystrike"
             "maps"
             "mayhem"
             "mikeplus64"
             "misc"
             "nieb"
             "nobiax"
             "particles"
             "philipk"
             "projectiles"
             "props"
             "skyboxes"
             "snipergoth"
             "sounds"
             "textures"
             "torley"
             "trak"
             "ulukai"
             "unnamed"
             "vanities"
             "vegetation"
             "weapons"
             "wicked")

pkgname="redeclipse"
pkgver=1.5.8
pkgrel=1
pkgdesc="free, casual arena shooter"
arch=("i686" "x86_64")
url="http://redeclipse.net"
license=("ZLIB" "CCPL:by-sa" "CCPL:by" "custom")
makedepends=("ed" "sdl2_mixer" "sdl2_image" "enet")
depends=("sdl2_image" "sdl2_mixer" "enet" "hicolor-icon-theme")
source=("base-$pkgver.tar.gz::https://github.com/red-eclipse/base/archive/v$pkgver.tar.gz"
        "redeclipse-1.5.5-build-with-system-enet.patch")
for _submodule in "${_submodules[@]}"; do
    source+=("$_submodule-$pkgver.tar.gz::https://github.com/red-eclipse/$_submodule/archive/v$pkgver.tar.gz")
done
sha256sums=('6c8ddfa140c7c0669d8b1e47043de7b1b9dd9b586edf531f74202ac6bb1209aa'
            '394cfa3f64385f05935467c88243432425304ef73dabd96fc35dcd66742f7bf9'
            'bd2369c4804ee6b155cc428255da795c6246fddff8eb7de018bbb9cc343aaf7e'
            '8a54802516963c72bb155e7ddabfcef1f928d19017973aa3beede37bb7ce0050'
            '4dae4f8fee4f936d4b497b1869fe37f9c698a59284e1ceb9b663c211dcc90e4a'
            'b8c6805f62649ed9ef15758c504369065a2abed114e11d339cc2e1a5a3fa60da'
            'c5d784fb6dbaa793d115393802b08dbe9c2c0d44fa925927885e7173c84400c3'
            '15d90168becff22d3e8fe65e916be87e98f8fc9955fd8c81bfc99e78aaacb9be'
            'ba04713bbac0888b279d20f7ef021058298e7a1cbc257e76975ea39d9b37233f'
            '1f5e77958bee721b4bbc81c42e05879bdc20f1d114346b3b77d65ca52fed5e17'
            '2c94ec233215bd28b0b89bb4adf52f1d94280b1f2721804f31ac0b60f4f49aa0'
            'ca1f643c2acb87f91feb8b312b9914c021695275d7a2d0529338137fd9bb0f08'
            'f32cc6596ac8ba39567eb73fc459df27a349f16c67ae44ad7e603db1289f4542'
            '5fefc5b890683ed580f6dc4754219c1ccb143b3fb5eb29cf2dfa64408001323a'
            'eeb576719ef70f546f177e2712a9ae0ef12705985be7e3be6e885dbfa5f54e7b'
            '21e4cc0c04900d6ea8b7493cc765904fb81ef65083ffc57bf1b98c2d71eba0ae'
            'aa62935a492d5705fd66b855e67d479d11e49859ddf00f19e4cfda5bfb0f2d31'
            '34cedadf469377f027d7d2ecd0c4e8e3d47001af0da736752a216675286e778c'
            'fd68d89d2d9a13e9b0b701d2bd78806e4b94a466ffc39d7edc1570ca93bdb6b4'
            '168759d8c902fa92a26b1a51c1493cba158115b3bc61d83af8d9d9ee8dbea2a7'
            '0cfc76d50a6199658ce8fc16b0c994c3c1502600df10b824584c247aa34d0294'
            '1742f5fb432a0c8b39da2557b09b38881301fd2378d92a556930925f6abc2a4d'
            '354d3a6bffeda5b9b34f25537c6cec36ed91d8623cf680068df2437b533e0219'
            '81b9f92d4a692675a96f50c4baf0b71c3654571273c302acdce1908f0d85ced0'
            '102fd1ec816c1068d91f9237f5c20eeecffb0ab514733dc4e97b585166445e0d'
            '4ccf48135f1bd13067b64446776770c5e59415b9bf393f33c63a9d55dd3bbffb'
            '264e4f5e614961bc78649dae9a0e865d7226436291c2700d000b7ab36045a9d6'
            '84c4f681fa897427aaf51fde2ff85a251ec09640f7197056a1e685f328af97ee'
            'cfad9d42146bf5fbf12550b8f62df548346d4ca958c131f237b06d86202fcf94'
            '50d75c07658d2c13e12c5ded1e00062b97a0e140514ff8a99e2957ff58a17072'
            '5bf545b97c3c0e36e3b682e57d5c54693793e24fcd588212750a7bd9ac798af6'
            '6d438993c53424831fbd59135704c42420d1897cad6253fcd6c9e2f9518fa98b'
            '658ac46a3f2875a466e6cc70d2d3c3555fa6a4241c16c4a68e4b28065183e13f'
            '2723bfffce17c6b35283fd91086a3bfc7ef3c7a371061162a8d76369bc746827'
            'c210686aaf3e01c8ac467c61c85009b57e55329a43938f015aeb864313767b54'
            'f69532fdf1c439fed00c0c90d7d41be80a736ef15614138924c2e4bf68aadf1f'
            '1d48866ced83e89aa77114796b19c74a46f6126f3c1f1579c312e6f64eb8da15'
            '62f58300ebc804b0f320c6bd9f46c29cca4be7da75f397ccf0b5e415dbe74f4a')

prepare() {
    for _submodule in "${_submodules[@]}"; do
        rmdir "base-$pkgver/data/$_submodule"
        mv "$_submodule-$pkgver" "base-$pkgver/data/$_submodule"
    done
    patch -d "base-$pkgver" -p0 -i "$srcdir/redeclipse-1.5.5-build-with-system-enet.patch"
}

build() {
    cd "base-$pkgver"
    make -C src/ client server
}

package() {
    cd "base-$pkgver"
    make -C src/ DESTDIR="$pkgdir" prefix=/usr system-install
    install -Dm 0644 "doc/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm 0644 "doc/all-licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/all-licenses.txt"
}
