# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=(otf-drafting ttf-drafting ttf-drafting-variable)
pkgbase=drafting-font
pkgver=1.1
pkgrel=1
pkgdesc='A monospace font by indestructible type* inspired by typewriters'
arch=(any)
url=https://indestructibletype.com/Drafting
license=(OFL)

# replace source once upstream starts using tags
_url=https://github.com/indestructible-type/Drafting
_commit=14182b3381808ecb310dbe83673ae86a7e4e0e2d
source=(
    $_url/raw/$_commit/fonts/otf/DraftingMono-{Bold,BoldItalic,ExtraLight,ExtraLightItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,SemiBold,SemiBoldItalic,Thin,ThinItalic}.otf
    $_url/raw/$_commit/fonts/ttf/DraftingMono-{Bold,BoldItalic,ExtraLight,ExtraLightItalic,Italic,Light,LightItalic,Medium,MediumItalic,Regular,SemiBold,SemiBoldItalic,Thin,ThinItalic}.ttf
    $_url/raw/$_commit/fonts/variable/Drafting{-Italic,}%5Bwght%5D.ttf
    $_url/raw/$_commit/OFL.txt
)
sha256sums=(
    0b8e70a39a8dce985fb9ac6c7d4622eaae2dda843b678f34ec837a834764e372
    aab3c1b0ab70ffed39d149e25379e380aa720c2be4388f36efa997c1e9333b48
    0debeded026063a7dbe40e5f4cb5e2e658336c3d1414edbed3ece5c501912578
    2abe136f40e645839df478bc3e4652ff0345a03ccb6d40f6a6fd3c6429b894cc
    460b4921d2ed810c238f853df9e984c0b4730b709a74f98833e7ab883bddcdd5
    7544193c4741a80c673b652096994cb753a85e8c55e1e197a85cc72db262f6cc
    934662129a87a66185d96c1cd98c5c41eb6e8fd94fc8e27d1ae78dd10480f1f3
    ec245b2efb7f8dd8c7cfc97e14598bb09429fa2d1adf21d103094ecfc481f6ff
    fea5f47c08c292240a6b51fb7f5aa178e786a3c5613905018f1a5c10b99baf55
    7aaafdf69ee31efa02eb16eeb923cbb5e06fad49e04d5ba0b70478c9a103caa3
    8feb0d5559d21def80d14072d76d8fc835348f482e9fe873d2621438e5ba2dea
    c9f03821393e6b627be4c943538f56db0c1232af41cce2aca2d99d1d15e4a64f
    8373a7d601f5376cd0796e3d05dcb3e7d3dd117dc64f0f39bf1262933229d799
    ddf73860d6462e3892cc81d39d0977e9f84858dd6836a8a8af81cc7580009bc6
    3b948df65f54d9029b6ca42916e2496c9e52a0fcfce77412e184350174ee410a
    ec72312290d7e8a9c9ff752470d9b2880ca31dff432408d4cf8047c4fb53b20e
    283bc0013fc7fcea372e56bcc42e1f48a70346a203cde1a359cb6e96436c1e80
    edfafa87237d53ca0d1506e26c697f29174855e0276fcc36ba92860808a51906
    d95ec669e8000c27c58c97481de38580ad107bc93978377ca21af54bcb4477f3
    ca57ecc5b848b593ce9cdf85eccc53af185069d4b1a2a5e052b4a9fd95744aa9
    6df64aa4e4b65687ff23b29c45f2d1f3d0586880392238096c65e3c3923c6a2a
    c98b8b27f7db5a411fe2b32d5389ba038cdb06d225cb6b0c002832670e0e6fa8
    0cf3ed64a9d662ab67359f3fdc64c6ba90eddbe6546bd671affcd0b2aceb7382
    274b8456ce6e5bc0469c8814d093f0aeec696197deebf0a35a64a4d67295ee70
    528c0f44b8f805c64d9a1d9d35ee62b5bd2db91ffa0243646349e002e091caa8
    b5141346cc3194c71905befbfe80059fde5c4518262ba526505b6fa11cc4574a
    c46bfc137470144d61875993060d432ab2f2bb1744964a5462c868d7283059e4
    04f3bba827a12de9f44ee40db3107aed33cb77ce5cb6a9bc9416a12ae428933d
    7984625cb60f007081dcc25bf79fb1dde492397a733c704916f3634b7c4ad645
    8723752955bddaba24991d2c454e6c8d18a67a1f3b91cbdddd6817fba7a49280
    c97a0aaa84df2535bbdd1a91094685cd87eeb3e62b5e1144bc9622ba1fceab4f
)

_pkgname=${pkgbase%-font}

package_otf-drafting() {
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname DraftingMono-*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
}

package_ttf-drafting() {
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname DraftingMono-*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
}

package_ttf-drafting-variable() {
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname *%5Bwght%5D.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
}
