# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgname=ksud
pkgver=3.3.0
pkgrel=1
pkgdesc='KernelSU userspace cli'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://kernelsu.org/'
license=('GPL-3.0-or-later')
makedepends=('cargo')
_srcname='KernelSU'
source=("$_srcname-$pkgver.tar.gz::https://github.com/tiann/$_srcname/archive/v$pkgver.tar.gz"
        "aarch64-android12-5.10_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android12-5.10_kernelsu.ko"
        "aarch64-android13-5.10_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android13-5.10_kernelsu.ko"
        "aarch64-android13-5.15_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android13-5.15_kernelsu.ko"
        "aarch64-android14-5.15_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android14-5.15_kernelsu.ko"
        "aarch64-android14-6.1_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android14-6.1_kernelsu.ko"
        "aarch64-android15-6.6_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android15-6.6_kernelsu.ko"
        "aarch64-android16-6.12_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android16-6.12_kernelsu.ko"
        "aarch64-android17-6.18_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-aarch64-android17-6.18_kernelsu.ko"
        "x86_64-android12-5.10_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android12-5.10_kernelsu.ko"
        "x86_64-android13-5.10_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android13-5.10_kernelsu.ko"
        "x86_64-android13-5.15_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android13-5.15_kernelsu.ko"
        "x86_64-android14-5.15_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android14-5.15_kernelsu.ko"
        "x86_64-android14-6.1_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android14-6.1_kernelsu.ko"
        "x86_64-android15-6.6_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android15-6.6_kernelsu.ko"
        "x86_64-android16-6.12_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android16-6.12_kernelsu.ko"
        "x86_64-android17-6.18_kernelsu.ko::https://github.com/tiann/$_srcname/releases/download/v$pkgver/lkm-x86_64-android17-6.18_kernelsu.ko"
        "ksuinit-aarch64::https://github.com/tiann/$_srcname/releases/download/v$pkgver/ksuinit-aarch64"
        "ksuinit-x86_64::https://github.com/tiann/$_srcname/releases/download/v$pkgver/ksuinit-x86_64"
)
sha512sums=('22c36d9d1911ce94ccd14cbe3ebc5e314d7cfde25b041ff58bf7b81021e2e6f66d3698027b4e28dd90731137789dc93169485e07a82d84d2c2bf83fbc622b4d0'
            '5efc65497b971626d014b49ca59fefce3a28c568275542e0db6fa48e2a30bd8ae1624d619da0c7f430e33de4b1fe21f9135b65ffd93602310f06c230693e7b36'
            '964322e165e1264d6d06138b3ba8bd491a7a3d456a2fa0420fc3bd92b0398d3cda964f4179825907926e7fe7fabbbd4d7ae1d1ede9e86a78987dd02f61cf6d69'
            '5d8625c37e90678dbfe0ee66c4b029d20430d0dc153b95f37d296699714b7a8fda560fe9b3b83b6be08b33af9413a1a226d64130d979c6ee651bff807e5409cc'
            '72c70c45c453a968821fa3ef9480cfa58cf1d74d0017bc4cb43032b20cd311dd62c9657ad0ac450b7ea6b823339d7d768ea9eb0edf2c0d571b7e8e02c04e134d'
            '118a8be2335eff8bf56958a7cb08062aaba0c22a71fb22e44b994670d1d1e4e76787578680ef731c971ba6d6fd1538668826125bb0785128de454ac06955f193'
            '0a897af7fcdb08ec60f39a4f51fa33cd3e93a42ff383053ed6608d8efdb92e5859c95de46c5d04abe9dcc7ece44ba2d17510dc1b868c4f54e132e450676000d4'
            'b476103da7da9ca0b53995a9cc5bbd74e669ef1503cfe118b098a1d34ea68d0a14296a7f39f38d33d7ead370518a9d41bf653b2fd1b70f43ebfdd9c4e27844d3'
            '4fa9cb050c0e09507ef41afafce0c324c02680fc7bd748ec472863fc1d2fe6a27f815d5da14de881648a7895186876af4aef3c69ec5484b6c6ec633c246eb75e'
            '40921958ec36b92b366fdcf421829738083a16c9a3a21457d7bb6c153bba9d818c86affc0e995d550fd49d4a01f91d81745dde527de694ff7e49b3e4475917d2'
            '2561fabd2d6737d83df1ccd3010d351506372e2fec2dfb8c5c04f98e5b48fdbc73f69325544d3a9f3793ef653de64f6bb0d0b3bee8a163d9ea199918cc907a93'
            '7d7dc0ce9b9dcab6c99cd7dded2ff327f8e0375c90937f7a50ce1c3e024ac20768922c62d7c871c1dbe38fcfd50139c07fbb36fbcbee3ef66990a2be98f9f0ec'
            '71b03ba4ce0b04134d1b3185ef377919da02b3ce464d778097fb29658ae403776d9341a7aff184889ea14ebfa8003a1c8d15e262a6731c70373d18fd5a20b61b'
            '4d0af747a9b09a584dcc2b88062c8d6712c9ed1fea0cefe2defd302b8178e117ab0e43ac3d390cfb178947dc2b2bb7d46fae1bf9128da8f551ab4897cf51a8e9'
            '1dcbbf27fd1c3b339670a58df3fa5071b8e8ced612b66680709169cc56882774c8eca9c08a04d7ab131a50ed4c81cdaa71cda93098d197a74aeffdae57639bd2'
            '97b1df2380e7e9c019463849b35044a60be7cb937d999ebe15ce0a5820c4fccbf357758051b9b90ea9d1c67904e55d388c4d7db44ac7b2d399e714e12831289d'
            '58ad09ee2b1ff0d4c72a15355e612c51cfd315c1b2edf171b4aa5290e00cdcf9a0e5675789509206ebd2661f5e1e2e58006d66f85932fabc0aedc75fb930a121'
            'e46f1ff29252c14091177be999745fbc7f955a84b9552eb52a8d452eb685ef0fe7a16efdf3d91bd85df368441e06b65425056d70b786e97b4af08175d4fb7c5a'
            '796fa8a258be416ce5e8787a2513dea60553e539ce14b980592238d9644f9294ee91e445513be408e2bb3d459e9e6b41144369b91aadb21afe03611a28a57d1c')
options=(!lto)

prepare() {
    cd "$_srcname-$pkgver/userspace/ksud/"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    for ko in "$srcdir"/*.ko; do
    	_ko=${ko##*/}
    
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
