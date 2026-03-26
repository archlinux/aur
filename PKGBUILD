# Maintainer: Reyka Matthies <openglfreak at googlemail dot com>

#_torch_platform=cu130
#_torch_platform=rocm7.2
_torch_platform=cpu
_vendored_portaudio=true

_name='VRCT'
_pkgname='vrct'
pkgname="$_pkgname-git"
pkgver=3.4.2
pkgrel=1
pkgdesc='VRChat Chatbox Translator & Transcription (Git version)'
arch=('x86_64')
url='https://misyaguziya.github.io/VRCT-Docs/'
license=('MIT')
depends=()
makedepends=('npm' 'pyenv' 'cargo' 'git')
conflicts=("$_pkgname")
provides=("$_pkgname")
install="$pkgname.install"
source=("git+https://github.com/misyaguziya/VRCT.git"
        '0001-Fix-Make-spec-files-platform-agnostic.patch'
        '0002-Fix-Fix-logo-SVG-reference-on-case-sensitive-file-sy.patch'
        '0003-Fix-Fix-requirements.txt-on-systems-without-PyAudioW.patch'
        '0004-Fix-Do-not-crash-in-recorder-or-transcriber-if-PyAud.patch'
        '0005-Fix-Support-microphone-input-on-systems-without-PyAu.patch'
        '0006-Feat-Support-speaker-input-on-systems-that-have-Puls.patch'
        '0007-Fix-Use-XDG-base-directories-for-config-and-logs-on-.patch'
        '0008-Fix-Download-models-to-data-dir-instead-of-local-dir.patch'
        '0009-Fix-Use-correct-program-to-open-folder-on-each-opera.patch'
        '0010-Feat-Allow-building-Tauri-App-AppImage.patch'
        '0011-Fix-Fix-error-when-running-PyInstaller.patch'
        '0012-Fix-Ignore-stderr-output-from-alsa-lib.patch'
        'disable-updater.patch'
        'vrct.sh'
        'VRCT.desktop')
sha256sums=('SKIP'
            '9525773077fad654d5ad2293ccdd7730d4629c6ebf2064de67d03aca76ca870d'
            'ca5b9d27521786c5e817f1ee3187aedcebcb74f8c7f70ffdbd66beaf1d637708'
            'e857d9ddb87b784c56122c53d9eb89ccbfcc5e211f6831b4159e3fe11095f5da'
            '6e05fca2f60b8026b51981f31446b2b2011b5461f959ec1c82129e7bda51ee6d'
            'cd6b79fc8da541d071f0072a55fed5005331706a5c70ae9e4c22ef6855983599'
            'a18f9ede8e089258603a79e3fba57a45f2f98289af9e09713fdc05c6bf87b47a'
            'a8ccb61517a2dd9dc8bc8807f01ead65134cf3dbd66cf976ec3226ea4575e733'
            '8f304819765df67513008b9f234efd52277206da2033827fad21b0a195692391'
            '6ac6e6dba2bf9829228886c9b6fc422ca89183412f04c3d9c3666226cd23cb1b'
            '091a0a6508b461eb49f3b2f827d9a69e1a3e7e0898356d5bca3a56ff85f4bd62'
            '841a9fd040ba0d3691a0c5bd6cb6c53fe5a27dc2bb5f04c5af1bdf508b5d69f3'
            '2bc50f102c2537fe270cad721b9723a0a9fd0efc0083ec7c62c9b8d6a0e5e909'
            'beb3d35bcf11688696369faeed8c29e0c7ad451d3e2f7c83fd9bcbbb32871359'
            '31722c9cff0ad36cee5a81b68eda86b9b30463e743f44561ea31df4078b85d91'
            '82438e4c5fa472144badef10b1dbdcdbf5313e079af46e23231be43e9c6b18cd')
b2sums=('SKIP'
        'cad6a467d8a181150062095d39ff5eff746fa90e7edca57da43e17b9c25b5371e6934ff08844c0b55feb02473a567fb9a55187738416eb3c4fdc12f82c7a3943'
        '1202655c3852f13637e9bff9b1a1f43c7e57163614172253390e7aa7da1d3832d893eb0b8f6681dae8fe51187e2024dbdfbee53eb2c94ba21c73281059a2bd73'
        'f0bc24ec33df831aadd9e614e3099d5749fbdcaf9979c0c78c0f0ee91a108790afa35c813e6ca195b65ff67f50fc1758092fbba5cf06af2f420ffe74111e4cf4'
        '8b0d2b8f9c8a6db7db70ccfc06980ce54ab04ae42ee4026cf38b72d02fc44a6f002c5ba5acba197fa61d3fcdb65c90a2afc471c5bcb4aff2296edd187e8f52cc'
        'f6202b7c24220f36f59a512abb9757f8c0f9bea35d3064f6f13a22e56245e614a2f453ed43a10e6b9e3baa20a944104d7a6dafb6385d57741281f60093efafb5'
        '1202055efdf0f49de8b192d45a0e16ecf88d5c07fac9eb9cc73961ed18cc84eff2088da36afeb870cdab4611a161394ef7714f01f800fb6cdbdd4c3608d6e983'
        '837bc2b7c3ee843235bec818e8a2f5188188626f42295bfb38e28d7bda11018add1dbfcebe8c7fb2fd5186a3a0b25f7b8534df28272dc7b00390050ae1606422'
        'c3910e5fb01d5ba65e8abc040e7ed16c3f37cc02f72c403bd36600d87550505188c6c893efdfff986a9bb5e0111aa917f2b8993522603487061d7c48c6668705'
        'ff68ca012f313d25a84577f8a6567bb71720624dee36b0e54b522dae89ba53aa51c8d7aac6e082cd3a442aa58e94fb574f76aa5d4b1ae9036b716b3f3bc88ac3'
        'd49a28668ed65391ce911745ce5b8ee7e159a2ab6b651404e3780306fd5f43e528a3496afe839800b29ebc9237bd8832a5495dde16aea694187ee9ac9c6217d8'
        '2676b344946aa8be35a5cc1f3f822bebb2365fa44b1fae317f1820b6377a0d7c676ebda1e05b3caef8218494febf7ec774712a0392c42c31ef950b22b129a4e6'
        '551987f49a6b158db01e1878beb7f33d99f691075bc6dedd9324d5ac2c0b03d7bccde2b56a7b11c0a0b35258a22f4ac2bc6658947cffd287ca14812651c78412'
        '040a4f6cd009fd2378476189dc2db4ab8cda4339f3b0aee81664fab1164dd0d0c43c266652f17d839c011c062130ed41e635f4f0c10bdc6aefc3fe123dd613d6'
        'cc661ecd970724a77af1278ab20d7d3eafc22119fb94ff7e310ee3eeb68af67d8c88d9e1e38c49117b8a45fbaedef4a506798cbc63214370a76105877b24763d'
        'ba6c3b3b03b860665f4db26609ca70ddf678acd79b85a62285d1b512431e7aca312118721fb808721fdadeced146443020808548adce825fb22a4f7e954a1816')

if [ "${_vendored_portaudio:-}" = true ] && ! [ "${GENINTEG:-}" = 1 ]; then
    source+=("git+https://github.com/PortAudio/portaudio.git")
    : && sha256sums+=('SKIP')
    : && b2sums+=('SKIP')
else
    depends+=('portaudio')
fi

if check_option 'lto' 'y'; then
    export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
fi
if check_option 'debug' 'y'; then
    export CARGO_PROFILE_RELEASE_DEBUG=2
fi

pkgver() {
    git -C VRCT log -1 --tags --pretty="format:%(describe:tags)" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

with_pyenv() (
    export PYENV_VERSION=3.12
    . "$srcdir/$_name/.venv/bin/activate"
    exec "$@"
)

prepare() {
    if [ "${_vendored_portaudio:-}" = true ]; then
        cd "$srcdir/portaudio"

        (
            cd bindings/cpp
            autoreconf -fiv
        )
        autoreconf -fiv
    fi

    cd "$srcdir/$_name"

    for patch in ../*.patch; do
        msg2 "$(gettext "Applying patch file %s")" "${patch#../}"
        patch -Np1 -i ../"$patch"
    done

    patch -Np1 <<'EOF'
diff --git a/spec/backend.spec b/spec/backend.spec
index e53f29ce..81e82b7d 100644
--- a/spec/backend.spec
+++ b/spec/backend.spec
@@ -24,6 +24,7 @@ a = Analysis(
     noarchive=False,
     optimize=0,
 )
+a.exclude_system_libraries()
 pyz = PYZ(a.pure)
 
 try:
EOF

    npm install --omit=dev
    npm audit fix --omit=dev --force
    npm install vite

    pyenv install --skip-existing 3.12
    PYENV_VERSION=3.12 pyenv exec python3 -m venv .venv
    with_pyenv python3 -m pip install --upgrade pip
    with_pyenv python3 -m pip install --prefer-binary --extra-index-url "https://download.pytorch.org/whl/${_torch_platform:-cpu}" -r requirements.txt

    export RUSTUP_TOOLCHAIN=stable
    cargo install tauri-cli
    cd src-tauri
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cd ..
}

build() {
    if [ "${_vendored_portaudio:-}" = true ]; then
        cd "$srcdir/portaudio"

        local configure_options=(
            --prefix="/opt/$_pkgname/_internal"
            --libdir="/opt/$_pkgname/_internal"
            --includedir="/portaudio_include"
            --enable-cxx
        )

        ./configure "${configure_options[@]}"
        make -j1
    fi

    cd "$srcdir/$_name"

    npm run vite build

    mkdir .venv/Lib
    ln -s ../lib/python3.12/site-packages -t .venv/Lib
    with_pyenv python3 -m PyInstaller spec/backend.spec --distpath src-tauri/bin --clean --noconfirm --log-level ERROR

    export CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN=stable
    cd src-tauri
    cargo tauri build --no-bundle
    cd ..
}

package() {
    install -d -Dm755 "$pkgdir/opt"
    install -d -Dm755 "$pkgdir/opt/$_pkgname"
    if [ "${_vendored_portaudio:-}" = true ]; then
        make -C "$srcdir/portaudio" DESTDIR="$pkgdir" install
        rm -r "$pkgdir/opt/vrct/_internal/pkgconfig"
        rm -r "$pkgdir/portaudio_include"
    fi
    install -Dm755 "$srcdir/$_name/src-tauri/target/release/VRCT" -t "$pkgdir/opt/$_pkgname"
    install -Dm755 "$srcdir/$_name/src-tauri/target/release/VRCT-sidecar" -t "$pkgdir/opt/$_pkgname"
    cp -a "$srcdir/$_name/src-tauri/target/release/_internal" -t "$pkgdir/opt/$_pkgname"
    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/applications"
    install -Dm644 VRCT.desktop -t "$pkgdir/usr/share/applications"
    install -d -Dm755 "$pkgdir/usr/share/icons"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/32x32"
    install -Dm644 "$srcdir/$_name/src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/128x128"
    install -Dm644 "$srcdir/$_name/src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/256x256"
    install -Dm644 "$srcdir/$_name/src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    install -Dm644 "$srcdir/$_name/src-tauri/icons/icon.ico" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.ico"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/512x512"
    install -Dm644 "$srcdir/$_name/src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$srcdir/$_name/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
