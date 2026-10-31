# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=3.3.1
pkgrel=2
pkgdesc='KernelSU userspace cli'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://kernelsu.org/'
license=('GPL-3.0-or-later')
makedepends=('cargo')
_srcname='KernelSU'
source=("$_srcname-$pkgver.tar.gz::https://github.com/tiann/$_srcname/archive/v$pkgver.tar.gz"
        "aarch64-android12-5.10_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android12-5.10_kernelsu.ko"
        "aarch64-android13-5.10_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android13-5.10_kernelsu.ko"
        "aarch64-android13-5.15_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android13-5.15_kernelsu.ko"
        "aarch64-android14-5.15_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android14-5.15_kernelsu.ko"
        "aarch64-android14-6.1_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android14-6.1_kernelsu.ko"
        "aarch64-android15-6.6_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android15-6.6_kernelsu.ko"
        "aarch64-android16-6.12_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android16-6.12_kernelsu.ko"
        "aarch64-android17-6.18_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android17-6.18_kernelsu.ko"
        "x86_64-android12-5.10_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android12-5.10_kernelsu.ko"
        "x86_64-android13-5.10_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android13-5.10_kernelsu.ko"
        "x86_64-android13-5.15_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android13-5.15_kernelsu.ko"
        "x86_64-android14-5.15_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android14-5.15_kernelsu.ko"
        "x86_64-android14-6.1_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android14-6.1_kernelsu.ko"
        "x86_64-android15-6.6_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android15-6.6_kernelsu.ko"
        "x86_64-android16-6.12_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android16-6.12_kernelsu.ko"
        "x86_64-android17-6.18_kernelsu_$pkgver.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android17-6.18_kernelsu.ko"
        "ksuinit-aarch64_$pkgver::https://github.com/tiann/$_srcname/releases/download/v$pkgver/ksuinit-aarch64"
        "ksuinit-x86_64_$pkgver::https://github.com/tiann/$_srcname/releases/download/v$pkgver/ksuinit-x86_64"
)
sha512sums=('106ed5542e8525b2f30769058fff544c17723ff63d3d3e379339375fba1f50d14a7966fab1e5ea36e20b17d3c21fd90ad45fc95470148377c4ad4190d9892887'
            '068ed947add2b58a985d29376eaf1231be535dfe3ac298e6182cd811b42b13cca28849e7c4ec918b7a2a45e73cd26ad6be15909a792b682c84da536ebf913994'
            'ceebd452794c237195aeefe94509d2cbb8206f9f2605d15b3080dccb382b3fe57d64b05da30c8a35e5dbc9ad70598e30b9440ce6fdad35047d573e40dfad7852'
            '209bd25de30dcb1a4246e84208cbd0ebb04f63bd0f4ba2fff52d9b3ddf97b4ba956d4eedff07aee3eb205fccaa20bc7bf2eff9b9465be1c3ce9664d6d87d1936'
            '293d0a3de4bbd275c3ca5a56df6b04bd13c65a32b4135a188766558315487e8fe9df1ea25ee05b31c67fe34c52dfbcd99b6152a78044a4b11b8b550468612e21'
            '3ca2e584bfe8a20c1b55bf571069efa6a7e46c790d2cf6bed4107dca8b8c8fd952ed7b477f099df6aa8c91b57f330f1d6ecaac3d84be2710cff6e5e42549f33a'
            'dbecbd2f59323f599c1260cd120d986c66909b6412bdb03e372ca0de85057ed0814fadd6dc414334e5a6bddb817297287019e204a3e85a1df48175bd25e03923'
            '660e4029747362d1dd0a3358df63b16f31f9a47b4e574eea89ad85871f9853e553da8c277fd55fb3319acd96f332b5572db06e0c33fe1fe3318fd1d7e0c33e56'
            '5d5be2889bdcb07f7b1d746ee4f05b1c6eedb1e7e26149f8ea34e2ba233829190e6278b177966a614e17e3c8403ff92c4af8bf876aa26418061a34e1f73acb04'
            'f8df1a6255849c162e941738d91208b01cda575fa500b91ff7ce7169ad4c9c79f4b146747611911b41991d71e2cb50b74f69b304a6c538d60a535b4d5c44a0ea'
            '84ef1aebfbd0772876b80ffcb0f58082ec90d72d6d5f435503b5d41fefa1c8888f0b26f1665bd84b7c1603106f4d052e29ccc130be76585dffd6cc91536024dc'
            '1336c6294b3ca05de1c829800deee734ec55115d5a3a6057885cfccfce658e2362655ac6bce866bac693933a7b755ec98f6c5c9f5e6e6670fd7d16c74ccdc98b'
            '0d319c4f6b76edb26db6b2a26cf93e1c25a8b29950bb6748796a6a0f3e9443d9f6a69fb21336abdb5afa0abdba4ae65c1b625aeb59307c08db70cd9b7da9f4ce'
            '8813a003f205dec0827e396db9af2325f164186ff1e8354c6b020b8161bf373c8be477e785a35f07d378f92e918a0383799d4e040240f1507c1e7c9c2493d7a9'
            'eb27defaae7b69d4d698e4f9a4d0188c7f67d60f56b913cace852982de517dacce6253e3ea001528bbaa2d1913164044fd11734af7ce6cc2c21b718ac480b9c1'
            '4f571727c4fafc41b5882c8a98802691e5d42a0df4dc6b2611124eeebd78fc4565ae3dc77e0ab3aef3bfd1f2fdbc77a9894938abbb850e5010041a12998f7b91'
            '46b5ababa4bff1111dd87d56b333f49f9464702c7c0528b2cf0c6f4f2c76cb38ea5e127a2fb2b5f345006e7652c34044201d8be31aa9e91215bbd030aa5ddf52'
            '8ff3c2d727e9a7b60f5f6ffc1a1277bda53659c88d4a22f6e3bfbcbe5b841a9e0f1a842301948b2efae98979575fbfcb1e5874131b2b3865a6cbdadb1ab58528'
            'edf3e014500704505ae8593c7ea929e17524e0bae877b311ef57ce61e2560a857c6a1c6051e45195f4be23869632fb9285323bd9a2e9efa866de3f42f4367e93')
options=(!lto)

prepare() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    for ko in "$srcdir"/*.ko; do
        _ko=${ko##*/}
        _ko=${_ko%_$pkgver.ko}
    
        case $_ko in
        aarch64-*)
            _arch=aarch64
            _ko=${_ko#aarch64-}
            ;;
        x86_64-*)
            _arch=x86_64
            _ko=${_ko#x86_64-}
            ;;
        *)
            printf 'error: unknown architecture prefix: %s\n' "$_ko" >&2
            exit 1
            ;;
        esac
    
        install -v -Dm644 "$ko" "bin/$_arch/$_ko"
    done
    
    for ksuinit in "$srcdir"/ksuinit-*; do
        _ksuinit=${ksuinit##*/}
        _ksuinit=${_ksuinit%_$pkgver}
    
        case $_ksuinit in
        ksuinit-aarch64)
            _arch=aarch64
            ;;
        ksuinit-x86_64)
            _arch=x86_64
            ;;
        *)
            printf 'error: unknown ksuinit architecture: %s\n' "$_ksuinit" >&2
            exit 1
            ;;
        esac
    
        install -v -Dm755 "$ksuinit" "bin/$_arch/ksuinit"
    done

}

build() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # workaround: static linking to Rust crate `zstd-sys`'
    # vendored `libzstd.a` library will cause some issue when
    # `options=(lto)` is turned on, so we link dynamically
    # to system zstd library to prevent this from happening
    ## disabled due to the `lz4-sys` does not give us an option
    ## to use system lz4 library, so currently we disable lto
    ## to avoid all the linking issue
    # export ZSTD_SYS_USE_PKG_CONFIG=1

    cargo build --frozen --release --all-features
}

package() {
    cd "$_srcname-$pkgver"

    install -Dm755 "userspace/ksud/target/release/$pkgname"     -t "$pkgdir/usr/bin/"
    install -Dm644 "LICENSE"                                    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
