# Use environment variable MAKEPKG_AYUGRAM_API_ID and MAKEPKG_AYUGRAM_API_HASH to override default values

_libtgvoip_commit=25facad342c3280315f9ef553906f46c3eeba1e4
_libtgvoip_cmake_commit=39aa77999e4b3cdec080f8e7eec9a4a45ccf6fc3
_gsl_commit=09938e870420b69a01f55c755207c871bc20b4e5
_xxhash_commit=bbb27a5efb85b92a0486cf361a8635715a53f6ba
_rlottie_commit=8c69fc20cf2e150db304311f1233a4b55a8892d7
_lz4_commit=5ff839680134437dbf4678f3d0c7b371d84f4964
_lib_crl_commit=078006d29af0002e6cd8c61a405cdeaf65b37142
_lib_rpl_commit=8b1015d1bd57ef03fcd07a3eeddd3f5a9b688ade
_lib_base_commit=bc78a03b12b40ee6264ad2235465197b89588288
_codegen_commit=afed06a4c04d1a1cf7cfce4faca273e1f574462e
_lib_ui_commit=48565bd5633aa448d6fef600c50eed950ec91e10
_lib_lottie_commit=1a700e5a0d7c3e2f617530354ff2a47c5c72bb4a
_lib_tl_commit=11c8ae47ff9c9d69b0470700fff9ed924a97acd3
_lib_spellcheck_commit=96543c1716d3790ef12bdec6b113958427710441
_lib_storage_commit=0971b69ca90f1697ef81276d9820dcd6d26de4ac
_cmake_helpers_commit=a32690808bd91c15206524eb7fd3a346bf51b149
_cmake_cppgir_commit=748a04795616f792f6fe91edf24620f78a2ef65c
_cmake_cppgir_expected_lite_commit=95b9cb015fa17baa749c2b396b335906e1596a9e
_cmake_implib_so_commit=0ddaa715d2572b100f8248c0fa4450fbf895be14
_expected_commit=292eff8bd8ee230a7df1d6a1c00c4ea0eb2f0362
_qr_commit=720f62bddb7226106071d4728c292cb1df519ceb
_lib_qr_commit=501f4c3502fd872ab4d777df8911bdac32de7c48
_hunspell_commit=22c3381e2066bed616250d373fc5c935598b564a
_range_v3_commit=a81477931a8aa2ad025c6bda0609f38e09e4d7ec
_nimf_commit=955ee48b4f4020b317ece1e3b1e58c0b7f4bd0f3
_hime_commit=9b3e6f9ab59d1fe4d9de73d3bf0fed7789f921c5
_fcitx5_qt_commit=413747e761b13bacc5ebd01e20810c64c2f3b6dc
_lib_webrtc_commit=5493af61df5cb90a30b686296521961763a009e0
_tgcalls_commit=b9fa8b84d8abe741183f157218ac038c596a54a5
_lib_webview_commit=75cc4c04d28a09172b1df596913c09161aaede35
_swift_corelibs_libdispatch_commit=ee39300b12a77efd3f2f020e009e42d557adbb29
_plasma_wayland_protocols_commit=78fc6ee77334a147986f01c6d3c6e1b99af1a333
_wayland_protocols_commit=4624cfaaf563cd7be5e2e2087c8de6d3a48ea867
_kimageformats_commit=63a9de758f4132b73ea4535fd9dd7fde3138dc33
_kcoreaddons_commit=79b99f162b200413671dbabe21c73356d9956e35
_cld3_commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
_wayland_commit=b2649cb3ee6bd70828a17e50beb16591e6066288
_libprisma_commit=adf35ba88160777ce5b8d122630852394c58279f

pkgname=ayugram-desktop
pkgver=4.14.13
pkgrel=1
pkgdesc="Desktop Telegram client with good customization and Ghost mode."
arch=("x86_64")
url="https://github.com/AyuGram/AyuGramDesktop"
license=("GPL-3.0-only")
depends=(
    "hunspell" "ffmpeg" "hicolor-icon-theme" "lz4" "minizip" "openal" "ttf-opensans"
    "qt6-imageformats" "qt6-svg" "qt6-wayland" "xxhash" "rnnoise" "pipewire" "libxtst"
    "libxrandr" "libxcomposite" "jemalloc" "abseil-cpp" "libdispatch" "openssl" "protobuf"
    "glib2" "libsigc++-3.0" "glibmm-2.68"
)
makedepends=(
    "cmake" "ninja" "python" "range-v3" "tl-expected" "microsoft-gsl" "meson"
    "extra-cmake-modules" "wayland-protocols" "plasma-wayland-protocols" "libtg_owt"
    "gobject-introspection" "boost" "fmt" "mm-common" "perl-xml-parser"
)
optdepends=(
    "webkit2gtk: embedded browser features"
    "xdg-desktop-portal: desktop integration"
)
source=(
    "AyuGram-v$pkgver.tar.gz::https://github.com/AyuGram/AyuGramDesktop/archive/refs/tags/v$pkgver.tar.gz"
    "cmake_helpers-$_cmake_helpers_commit.tar.gz::https://github.com/desktop-app/cmake_helpers/archive/$_cmake_helpers_commit.tar.gz"
    "Implib.so-$_cmake_implib_so_commit.tar.gz::https://github.com/yugr/Implib.so/archive/$_cmake_implib_so_commit.tar.gz"
    "cppgir-$_cmake_cppgir_commit.tar.gz::https://gitlab.com/mnauw/cppgir/-/archive/$_cmake_cppgir_commit/cppgir-$_cmake_cppgir_commit.tar.gz"
    "expected-lite-$_cmake_cppgir_expected_lite_commit.tar.gz::https://github.com/martinmoene/expected-lite/archive/$_cmake_cppgir_expected_lite_commit.tar.gz"
    "codegen-$_codegen_commit.tar.gz::https://github.com/desktop-app/codegen/archive/$_codegen_commit.tar.gz"
    "lib_base-$_lib_base_commit.tar.gz::https://github.com/desktop-app/lib_base/archive/$_lib_base_commit.tar.gz"
    "lib_crl-$_lib_crl_commit.tar.gz::https://github.com/desktop-app/lib_crl/archive/$_lib_crl_commit.tar.gz"
    "lib_lottie-$_lib_lottie_commit.tar.gz::https://github.com/desktop-app/lib_lottie/archive/$_lib_lottie_commit.tar.gz"
    "lib_qr-$_lib_qr_commit.tar.gz::https://github.com/desktop-app/lib_qr/archive/$_lib_qr_commit.tar.gz"
    "lib_rpl-$_lib_rpl_commit.tar.gz::https://github.com/desktop-app/lib_rpl/archive/$_lib_rpl_commit.tar.gz"
    "lib_spellcheck-$_lib_spellcheck_commit.tar.gz::https://github.com/desktop-app/lib_spellcheck/archive/$_lib_spellcheck_commit.tar.gz"
    "lib_storage-$_lib_storage_commit.tar.gz::https://github.com/desktop-app/lib_storage/archive/$_lib_storage_commit.tar.gz"
    "lib_tl-$_lib_tl_commit.tar.gz::https://github.com/AyuGram/lib_tl/archive/$_lib_tl_commit.tar.gz"
    "lib_ui-$_lib_ui_commit.tar.gz::https://github.com/AyuGram/lib_ui/archive/$_lib_ui_commit.tar.gz"
    "lib_webrtc-$_lib_webrtc_commit.tar.gz::https://github.com/desktop-app/lib_webrtc/archive/$_lib_webrtc_commit.tar.gz"
    "lib_webview-$_lib_webview_commit.tar.gz::https://github.com/desktop-app/lib_webview/archive/$_lib_webview_commit.tar.gz"
    "GSL-$_gsl_commit.tar.gz::https://github.com/desktop-app/GSL/archive/$_gsl_commit.tar.gz"
    "QR-$_qr_commit.tar.gz::https://github.com/nayuki/QR-Code-generator/archive/$_qr_commit.tar.gz"
    "cld3-$_cld3_commit.tar.gz::https://github.com/google/cld3/archive/$_cld3_commit.tar.gz"
    "dispatch-$_swift_corelibs_libdispatch_commit.tar.gz::https://github.com/apple/swift-corelibs-libdispatch/archive/$_swift_corelibs_libdispatch_commit.tar.gz"
    "expected-$_expected_commit.tar.gz::https://github.com/TartanLlama/expected/archive/$_expected_commit.tar.gz"
    "fcitx5-qt-$_fcitx5_qt_commit.tar.gz::https://github.com/fcitx/fcitx5-qt/archive/$_fcitx5_qt_commit.tar.gz"
    "hime-$_hime_commit.tar.gz::https://github.com/hime-ime/hime/archive/$_hime_commit.tar.gz"
    "hunspell-$_hunspell_commit.tar.gz::https://github.com/hunspell/hunspell/archive/$_hunspell_commit.tar.gz"
    "kcoreaddons-$_kcoreaddons_commit.tar.gz::https://github.com/KDE/kcoreaddons/archive/$_kcoreaddons_commit.tar.gz"
    "kimageformats-$_kimageformats_commit.tar.gz::https://github.com/KDE/kimageformats/archive/$_kimageformats_commit.tar.gz"
    "libprisma-$_libprisma_commit.tar.gz::https://github.com/desktop-app/libprisma/archive/$_libprisma_commit.tar.gz"
    "libtgvoip-$_libtgvoip_commit.tar.gz::https://github.com/telegramdesktop/libtgvoip/archive/$_libtgvoip_commit.tar.gz"
    "cmake_helpers-$_libtgvoip_cmake_commit.tar.gz::https://github.com/desktop-app/cmake_helpers/archive/$_libtgvoip_cmake_commit.tar.gz"
    "lz4-$_lz4_commit.tar.gz::https://github.com/lz4/lz4/archive/$_lz4_commit.tar.gz"
    "nimf-$_nimf_commit.tar.gz::https://github.com/hamonikr/nimf/archive/$_nimf_commit.tar.gz"
    "plasma-wayland-protocols-$_plasma_wayland_protocols_commit.tar.gz::https://github.com/KDE/plasma-wayland-protocols/archive/$_plasma_wayland_protocols_commit.tar.gz"
    "range-v3-$_range_v3_commit.tar.gz::https://github.com/ericniebler/range-v3/archive/$_range_v3_commit.tar.gz"
    "rlottie-$_rlottie_commit.tar.gz::https://github.com/desktop-app/rlottie/archive/$_rlottie_commit.tar.gz"
    "tgcalls-$_tgcalls_commit.tar.gz::https://github.com/TelegramMessenger/tgcalls/archive/$_tgcalls_commit.tar.gz"
    "wayland-$_wayland_commit.tar.gz::https://github.com/gitlab-freedesktop-mirrors/wayland/archive/$_wayland_commit.tar.gz"
    "wayland-protocols-$_wayland_protocols_commit.tar.gz::https://github.com/gitlab-freedesktop-mirrors/wayland-protocols/archive/$_wayland_protocols_commit.tar.gz"
    "xxHash-$_xxhash_commit.tar.gz::https://github.com/Cyan4973/xxHash/archive/$_xxhash_commit.tar.gz"
)
sha256sums=('7a2e7498585f59ddaca07645523bce300e1eaedfe15e0eed1c9f07cf0df06d01'
            'ab608aa53f089f76dc806673d6d3300d72849a598d1df4e5fdaa1a6f77e894cd'
            '15a9981ab5e6a01f301609017aee11e000c22880d38b3be4e3da58c338f9b2fc'
            '47e0816b744e7aa4dfbd5862676110773737f7ecab3afdbb4f33af223ad50e32'
            '7238a966ee6b93fdbf2669736ddd35a6103967eb9d5369af8b740bff2401615c'
            'c7083f7621d873d0734b1a68c8370faf45b44c04aa7465c63a3b1a48ff536057'
            '09895518ce0c0449f6f3a486832284c9e4dbf91f5906639671b11eec380e8131'
            '4fed49839e82c934def32d5890770d34815f0a94a87868ba6848379cc841f110'
            'c9aa4e32eb5e475d0826154055ff4749c07bb46d83b12f1641d31557e944a16f'
            '855997c49f5f7263b8270662d03c8a1d5ba1868664a150e0f837679e2629a5ab'
            '8b4ba7258685e49c9b7f2c60925264c3b2713805ad21304404d5f6b77cd5582b'
            '63cdb4f69550921320ecc3bd1ec88080ff081b3a11f62ba00148dbbb5bb5e7b4'
            '22a1bfb607c1f6475834e774d9030f54161371dfbcc86108511bc63cbaaae24e'
            '996fdbcc6f99f44963c867a701bf8ab4179f32f3536ed32895a009ab569a4d66'
            '98a8ad561c034038aa4dc2bf0843e4ec0db62fed35507bdef164d9556ac92591'
            'a8f696fcf6bc85b0e9bfa898f85db94267c1e3c17ee80e5d857d9fe10efec3c2'
            '52b98bde90a7bfff79f631d1a778ab2a7a311ca1c62036e1c3142cb8e3deae01'
            '29bcc3c359378b83fda299ef1a0930886cb7937b893856ca476c47f90002ffa7'
            'd80795686f3e58448c7b76830bb5c40847b7eaae1996c28f0422a029b66c2bb0'
            'd0d4ea2fddcbc7d10ace2c37309feb09da87e8ce7ced6ce73592da1359f4765f'
            '1142f3ccaf7750e4cf452aa9c39336b7029f2aee337957ef646da23a7b08ac62'
            'fe3b18aecb849029b6af94922be0c25eee1b7b86565b1c8350692ed776cf42fb'
            '31c329173d5259b5855b63edb4423f0c9910481418017f2ce49b1a8278b600b8'
            '52a2e052beb67492225a38213108f1d7edd1940fd025cad3a4ae28c57d428419'
            '3e7253b2cc31bdf68fa50d105715158e649812e5ad6b4f1f6e5fd1e89b3ffdfd'
            '39a635a5a0f4e7d3887a1d7207892be5af5adcf1bc135062f3af72fe5ab7b470'
            '5e09f8457fb5fea80750f63c0363f1d46cf671f2f1c1af886e7b5cc85286e06b'
            'f5f94a60077a15a0c583318703c7f1104c48bba93c8cbfa66fb9b6b8dda07cdf'
            'dee085433f53dbeb7687e4f605f656871199384486f3000e343da38e4acb1e38'
            'd0752fbb2ef6dc9dd1484252fe1027282019c74168da9ed7852abdf94fc5d73e'
            '11b926f9605b258c35bd9ed806a10cab7ef5edd673ad53a014427b1c71d24a9e'
            'fc22d9e6f2fa269fc607de20a5104644bc8b3ed5648fbad588f1d4933f4bc7f3'
            '9c3073b602af6edf8c0d9355325b6f7eddc3732a0c958983fbbe775dd6e0662f'
            '612b5d89f58a578240b28a1304ffb0d085686ebe0137adf175ed0e3382b7ed58'
            'cbc1f4bf8c28ffeb89852eda7056ff6aa80d49cb45736a583c931d5ceeccdcdd'
            '0de97c65d3833051ead485c2130d20049b32e0190a7bf965c8696544e749949c'
            '3454ad000136aef5d51a74a9c4714ed7e39914e30957f77ea18e8953ebe6cb78'
            'c9c7364bc59fb9421e3f87c421b87ef910e140b4b8144511106dee4bf5f78f18'
            '716fbe4fc85ecd36488afbbc635b59b5ab6aba5ed3b69d4a32a46eae5a453d38')

prepare() {
    cd "$srcdir/AyuGramDesktop-$pkgver"
    _modules=(
        cmake cmake/external/Implib.so cmake/external/glib/cppgir cmake/external/glib/cppgir/expected-lite
        Telegram/codegen Telegram/lib_{base,crl,lottie,qr,rpl,spellcheck,storage,tl,ui,webrtc,webview}
        Telegram/ThirdParty/{GSL,QR,cld3,dispatch,expected,fcitx5-qt,hime,hunspell,kcoreaddons,kimageformats,libprisma,libtgvoip{,/cmake},lz4,nimf,plasma-wayland-protocols,range-v3,rlottie,tgcalls,wayland,wayland-protocols,xxHash}
    )
    for module in "${_modules[@]}"
    do
        module_name=$(basename "$module")
        case $module in
            cmake/external/glib/cppgir/expected-lite)
                commit=$_cmake_cppgir_expected_lite_commit
                ;;
            cmake/external/glib/cppgir)
                commit=$_cmake_cppgir_commit
                ;;
            cmake/external/Implib.so)
                commit=$_cmake_implib_so_commit
                ;;
            cmake)
                commit=$_cmake_helpers_commit
                module_name=cmake_helpers
                ;;
            Telegram/ThirdParty/libtgvoip/cmake)
                commit=$_libtgvoip_cmake_commit
                module_name=cmake_helpers
                ;;
            Telegram/ThirdParty/dispatch)
                commit=$_swift_corelibs_libdispatch_commit
                module_name=swift-corelibs-libdispatch
                ;;
            Telegram/ThirdParty/xxHash)
                commit=$_xxhash_commit
                ;;
            Telegram/ThirdParty/GSL)
                commit=$_gsl_commit
                ;;
            Telegram/ThirdParty/QR)
                commit=$_qr_commit
                module_name=QR-Code-generator
                ;;
            *)
                commit=$(eval "echo \$_${module_name//-/_}_commit")
                ;;
        esac
        echo "Copying $module from $module_name-$commit"
        cp -r "$srcdir/$module_name-$commit/"* "$module"
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
