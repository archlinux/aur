# Use environment variable MAKEPKG_AYUGRAM_API_ID and MAKEPKG_AYUGRAM_API_HASH to override default values

pkgname=ayugram-desktop
pkgver=5.1.2
pkgrel=1
pkgdesc="Desktop Telegram client with good customization and Ghost mode."
arch=("x86_64")
url="https://github.com/AyuGram/AyuGramDesktop"
license=("GPL-3.0-only")
depends=(
    "hunspell" "ffmpeg" "hicolor-icon-theme" "lz4" "minizip" "openal"
    "qt6-imageformats" "qt6-svg" "qt6-wayland" "xxhash" 
    "rnnoise" "pipewire" "libxtst" "libxrandr" "libxcomposite" "libxdamage" "abseil-cpp" "libdispatch" 
    "openssl" "protobuf" "glib2" "libsigc++-3.0" "kcoreaddons"
)
makedepends=(
    "cmake" "ninja" "python" "range-v3" "tl-expected" "microsoft-gsl" "meson"
    "extra-cmake-modules" "wayland-protocols" "plasma-wayland-protocols" "libtg_owt"
    "gobject-introspection" "boost" "fmt" "mm-common" "perl-xml-parser" "python-packaging"
)
optdepends=(
    "webkit2gtk: embedded browser features"
    "xdg-desktop-portal: desktop integration"
)
source=(
    "AyuGram-v$pkgver.tar.gz::https://github.com/AyuGram/AyuGramDesktop/archive/refs/tags/v$pkgver.tar.gz"
)
declare -rAg _modules_name_map=(
    [cmake]=https://github.com/desktop-app/cmake_helpers/archive/a7527c0e6eba1c71cd0dfd7bd8de9c1e68cb529f.tar.gz
    [cmake/external/Implib.so]=https://github.com/yugr/Implib.so/archive/0ddaa715d2572b100f8248c0fa4450fbf895be14.tar.gz
    [cmake/external/glib/cppgir]=https://gitlab.com/mnauw/cppgir/-/archive/9c4f5820d94d62ab451501f016bfea97156518f4/cppgir-9c4f5820d94d62ab451501f016bfea97156518f4.tar.gz
    [cmake/external/glib/cppgir/expected-lite]=https://github.com/martinmoene/expected-lite/archive/95b9cb015fa17baa749c2b396b335906e1596a9e.tar.gz
    [Telegram/codegen]=https://github.com/desktop-app/codegen/archive/0af136124083369073b8fdaf45f0816fd2b10bad.tar.gz
    [Telegram/lib_base]=https://github.com/desktop-app/lib_base/archive/4d56f8b4bba52b46844f46fafa5f9b6b2704429e.tar.gz
    [Telegram/lib_crl]=https://github.com/desktop-app/lib_crl/archive/078006d29af0002e6cd8c61a405cdeaf65b37142.tar.gz
    [Telegram/lib_lottie]=https://github.com/desktop-app/lib_lottie/archive/1a700e5a0d7c3e2f617530354ff2a47c5c72bb4a.tar.gz
    [Telegram/lib_qr]=https://github.com/desktop-app/lib_qr/archive/501f4c3502fd872ab4d777df8911bdac32de7c48.tar.gz
    [Telegram/lib_rpl]=https://github.com/desktop-app/lib_rpl/archive/8b1015d1bd57ef03fcd07a3eeddd3f5a9b688ade.tar.gz
    [Telegram/lib_spellcheck]=https://github.com/desktop-app/lib_spellcheck/archive/9b52030bfcd7e90e3e550231a3783ad1982fda78.tar.gz
    [Telegram/lib_storage]=https://github.com/desktop-app/lib_storage/archive/0971b69ca90f1697ef81276d9820dcd6d26de4ac.tar.gz
    [Telegram/lib_tl]=https://github.com/AyuGram/lib_tl/archive/11c8ae47ff9c9d69b0470700fff9ed924a97acd3.tar.gz
    [Telegram/lib_ui]=https://github.com/AyuGram/lib_ui/archive/2918db18e0fb2d1be05d4e43fb9192e3a7cf6408.tar.gz
    [Telegram/lib_webrtc]=https://github.com/desktop-app/lib_webrtc/archive/f701713cd798bd7d5f69d318fdefb125d101aa76.tar.gz
    [Telegram/lib_webview]=https://github.com/desktop-app/lib_webview/archive/115530c7aa8694f461d04f95d6a3561a18562e7e.tar.gz
    [Telegram/ThirdParty/GSL]=https://github.com/desktop-app/GSL/archive/09938e870420b69a01f55c755207c871bc20b4e5.tar.gz
    [Telegram/ThirdParty/QR]=https://github.com/nayuki/QR-Code-generator/archive/720f62bddb7226106071d4728c292cb1df519ceb.tar.gz
    [Telegram/ThirdParty/cld3]=https://github.com/google/cld3/archive/b48dc46512566f5a2d41118c8c1116c4f96dc661.tar.gz
    [Telegram/ThirdParty/dispatch]=https://github.com/apple/swift-corelibs-libdispatch/archive/ee39300b12a77efd3f2f020e009e42d557adbb29.tar.gz
    [Telegram/ThirdParty/expected]=https://github.com/TartanLlama/expected/archive/292eff8bd8ee230a7df1d6a1c00c4ea0eb2f0362.tar.gz
    [Telegram/ThirdParty/fcitx5-qt]=https://github.com/fcitx/fcitx5-qt/archive/cc77e32c0ab675a663a7c019b3bb8cfcc60c5ec3.tar.gz
    [Telegram/ThirdParty/hime]=https://github.com/hime-ime/hime/archive/9b3e6f9ab59d1fe4d9de73d3bf0fed7789f921c5.tar.gz
    [Telegram/ThirdParty/hunspell]=https://github.com/hunspell/hunspell/archive/22c3381e2066bed616250d373fc5c935598b564a.tar.gz
    [Telegram/ThirdParty/jemalloc]=https://github.com/jemalloc/jemalloc/archive/54eaed1d8b56b1aa528be3bdd1877e59c56fa90c.tar.gz
    [Telegram/ThirdParty/kcoreaddons]=https://github.com/KDE/kcoreaddons/archive/79b99f162b200413671dbabe21c73356d9956e35.tar.gz
    [Telegram/ThirdParty/kimageformats]=https://github.com/KDE/kimageformats/archive/63a9de758f4132b73ea4535fd9dd7fde3138dc33.tar.gz
    [Telegram/ThirdParty/libprisma]=https://github.com/desktop-app/libprisma/archive/23b0d70f9709da9b38561d5706891a134d18df76.tar.gz
    [Telegram/ThirdParty/libtgvoip]=https://github.com/telegramdesktop/libtgvoip/archive/25facad342c3280315f9ef553906f46c3eeba1e4.tar.gz
    [Telegram/ThirdParty/libtgvoip/cmake]=https://github.com/desktop-app/cmake_helpers/archive/39aa77999e4b3cdec080f8e7eec9a4a45ccf6fc3.tar.gz
    [Telegram/ThirdParty/lz4]=https://github.com/lz4/lz4/archive/5ff839680134437dbf4678f3d0c7b371d84f4964.tar.gz
    [Telegram/ThirdParty/nimf]=https://github.com/hamonikr/nimf/archive/955ee48b4f4020b317ece1e3b1e58c0b7f4bd0f3.tar.gz
    [Telegram/ThirdParty/range-v3]=https://github.com/ericniebler/range-v3/archive/a81477931a8aa2ad025c6bda0609f38e09e4d7ec.tar.gz
    [Telegram/ThirdParty/rlottie]=https://github.com/desktop-app/rlottie/archive/8c69fc20cf2e150db304311f1233a4b55a8892d7.tar.gz
    [Telegram/ThirdParty/tgcalls]=https://github.com/TelegramMessenger/tgcalls/archive/b9fa8b84d8abe741183f157218ac038c596a54a5.tar.gz
    [Telegram/ThirdParty/xdg-desktop-portal]=https://github.com/flatpak/xdg-desktop-portal/archive/fa8d41a2f9a5d30a1e41568b6fb53b046dce14dc.tar.gz
    [Telegram/ThirdParty/xxHash]=https://github.com/Cyan4973/xxHash/archive/bbb27a5efb85b92a0486cf361a8635715a53f6ba.tar.gz
)
for uri in "${_modules_name_map[@]}"
do
    declare name commit source_str
    name=$(echo "$uri" | cut -d / -f 5)
    commit=${uri##*/}
    if [[ "$commit" == *-* ]]
    then
        source_str="$commit::$uri"
    else
        source_str="$name-$commit::$uri"
    fi
    if [[ "${source[*]/$source_str/}" == "${source[*]}" ]]
    then
        source+=("$source_str")
    fi
done
sha256sums=('f239a62a6dd75cb91d73cea272987ae55044407397a828a66aa8d0abb0d3a47f'
            'd0d4ea2fddcbc7d10ace2c37309feb09da87e8ce7ced6ce73592da1359f4765f'
            '4228fd9af322817423f82c0471233556ae59689efb067b449f9e8432d1acaaa8'
            '8b4ba7258685e49c9b7f2c60925264c3b2713805ad21304404d5f6b77cd5582b'
            'cbc1f4bf8c28ffeb89852eda7056ff6aa80d49cb45736a583c931d5ceeccdcdd'
            '3e7253b2cc31bdf68fa50d105715158e649812e5ad6b4f1f6e5fd1e89b3ffdfd'
            'c9aa4e32eb5e475d0826154055ff4749c07bb46d83b12f1641d31557e944a16f'
            'c1d9c4381b9dd0f832cca9096e54d969f227e0bc9ea041953fd839936f85b2d5'
            '1142f3ccaf7750e4cf452aa9c39336b7029f2aee337957ef646da23a7b08ac62'
            '49a1e648cff8b9d6ef78f58abb96eaad47f8a84fe71ecb7b6958ca6797402992'
            '9b1afca339bd4e0579e73e92478ea26bb0c845dca7231de031e66c2f1a4ea5d9'
            '716fbe4fc85ecd36488afbbc635b59b5ab6aba5ed3b69d4a32a46eae5a453d38'
            '11b926f9605b258c35bd9ed806a10cab7ef5edd673ad53a014427b1c71d24a9e'
            '29bcc3c359378b83fda299ef1a0930886cb7937b893856ca476c47f90002ffa7'
            'fe3b18aecb849029b6af94922be0c25eee1b7b86565b1c8350692ed776cf42fb'
            '5e09f8457fb5fea80750f63c0363f1d46cf671f2f1c1af886e7b5cc85286e06b'
            'dee085433f53dbeb7687e4f605f656871199384486f3000e343da38e4acb1e38'
            '15a9981ab5e6a01f301609017aee11e000c22880d38b3be4e3da58c338f9b2fc'
            '855997c49f5f7263b8270662d03c8a1d5ba1868664a150e0f837679e2629a5ab'
            'ec25bbd47ba895684e9f9a3dfbb9aa96a7573c4c84455542be23998d5eb0fad8'
            '612b5d89f58a578240b28a1304ffb0d085686ebe0137adf175ed0e3382b7ed58'
            '996fdbcc6f99f44963c867a701bf8ab4179f32f3536ed32895a009ab569a4d66'
            'a4946e129e4ec8e8ccb38f05fe8b5c701ebed78b32e9aa1b78d531159b39a7a4'
            '0de97c65d3833051ead485c2130d20049b32e0190a7bf965c8696544e749949c'
            'd80795686f3e58448c7b76830bb5c40847b7eaae1996c28f0422a029b66c2bb0'
            'aba69c97d466e82a13ae6c1d52628c7f7ec8f85c5224f8634fa26a313ebcc95f'
            'd0752fbb2ef6dc9dd1484252fe1027282019c74168da9ed7852abdf94fc5d73e'
            '39a635a5a0f4e7d3887a1d7207892be5af5adcf1bc135062f3af72fe5ab7b470'
            '52a2e052beb67492225a38213108f1d7edd1940fd025cad3a4ae28c57d428419'
            'fc22d9e6f2fa269fc607de20a5104644bc8b3ed5648fbad588f1d4933f4bc7f3'
            '4fed49839e82c934def32d5890770d34815f0a94a87868ba6848379cc841f110'
            '23afa0a99c984037d926df4e3e0328d527761ebfff3b4c5fe8bea7e5fff6e11a'
            '8335e34b2e1e9b0d0feecce2d187362786d67b4fde8a6260a7532bf9b722cdc6'
            '22a1bfb607c1f6475834e774d9030f54161371dfbcc86108511bc63cbaaae24e'
            '0a62974efb496f62554626281f75470c067922dd01c48e01606d96e2a25175fe'
            'fbc6c37bd4b8e14ea8a2dbbd1a653de62471e0f9b29d49b2c58c7fca127518d7'
            '7238a966ee6b93fdbf2669736ddd35a6103967eb9d5369af8b740bff2401615c'
            '7769897990f5fef925c45db7df19c8ae2ab6744d387f750bd20f4d4b6c8d1420')

prepare() {
    cd "$srcdir/AyuGramDesktop-$pkgver"
    declare -ra _modules=(
        cmake cmake/external/Implib.so cmake/external/glib/cppgir cmake/external/glib/cppgir/expected-lite
        Telegram/codegen Telegram/lib_base Telegram/lib_crl Telegram/lib_lottie Telegram/lib_qr Telegram/lib_rpl
        Telegram/lib_spellcheck Telegram/lib_storage Telegram/lib_tl Telegram/lib_ui Telegram/lib_webrtc Telegram/lib_webview
        Telegram/ThirdParty/GSL Telegram/ThirdParty/QR Telegram/ThirdParty/cld3 Telegram/ThirdParty/dispatch
        Telegram/ThirdParty/expected Telegram/ThirdParty/fcitx5-qt Telegram/ThirdParty/hime Telegram/ThirdParty/hunspell
        Telegram/ThirdParty/jemalloc Telegram/ThirdParty/kcoreaddons Telegram/ThirdParty/kimageformats Telegram/ThirdParty/libprisma
        Telegram/ThirdParty/libtgvoip Telegram/ThirdParty/libtgvoip/cmake Telegram/ThirdParty/lz4 Telegram/ThirdParty/nimf
        Telegram/ThirdParty/range-v3 Telegram/ThirdParty/rlottie Telegram/ThirdParty/tgcalls Telegram/ThirdParty/xxHash
        Telegram/ThirdParty/xdg-desktop-portal
    )
    for module in "${_modules[@]}"
    do
        uri=${_modules_name_map[$module]}
        declare name commit source_str
        name=$(echo "$uri" | cut -d / -f 5)
        commit=${uri##*/}
        if [[ "$commit" == *-* ]]
        then
            fname="${commit%%.*}"
        else
            fname=$name-${commit%%.*}
        fi
        echo "Copying $module from $fname"
        if [[ -d "$module" ]]
        then
            cp -r "$srcdir/$fname/"* "$module"
        else
            cp -r "$srcdir/$fname" "$module"
        fi
    done
    #/usr/bin/ld: /usr/lib/libprotobuf-lite.so: undefined reference to symbol '_ZN4absl12lts_2023080212log_internal17MakeCheckOpStringIllEEPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEET_T0_PKc'
    #/usr/bin/ld: /usr/lib/libabsl_log_internal_check_op.so.2308.0.0: error adding symbols: DSO missing from command line
    #collect2: error: ld returned 1 exit status
    #
    #https://github.com/telegramdesktop/tdesktop/issues/26489#issuecomment-1627535022
    sed -i 's/find_package(protobuf REQUIRED)/find_package(protobuf REQUIRED CONFIG)/' \
        Telegram/ThirdParty/cld3/CMakeLists.txt
    #https://github.com/telegramdesktop/tdesktop/issues/26489#issuecomment-1627555107
    #CMAKE_BUILD_TYPE must match libtg_owt's
}
build() {
    CXXFLAGS+=' -ffat-lto-objects'
    # https://github.com/AyuGram/AyuGramDesktop/blob/dev/docs/building-linux.md#building-the-project
    # for API_ID and API_HASH
    cmake -B build -S AyuGramDesktop-$pkgver -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID="${MAKEPKG_AYUGRAM_API_ID:-2040}" \
        -DTDESKTOP_API_HASH="${MAKEPKG_AYUGRAM_API_HASH:-b18441a1ff607e10a989891a5462e627}" \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=True
    cmake --build build
}
package() {
    DESTDIR="$pkgdir" cmake --install build
}
