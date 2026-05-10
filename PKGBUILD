# Maintainer: Reyka Matthies <openglfreak at googlemail dot com>

#_torch_platform=cu130
#_torch_platform=rocm7.2
_torch_platform=cpu
_vendored_portaudio=true

_name='VRCT'
_pkgname='vrct'
pkgname="$_pkgname-git"
pkgver=3.4.3
pkgrel=1
pkgdesc='VRChat Chatbox Translator & Transcription (Git version)'
arch=('x86_64')
url='https://misyaguziya.github.io/VRCT-Docs/'
license=('MIT')
_tauri_depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup' 'pango' 'webkit2gtk-4.1' 'appmenu-gtk-module')
_python_depends=('libsqlite3.so' 'libuuid.so' 'libbz2.so' 'libexpat.so' 'libffi.so' 'libnsl.so' 'libcrypt.so' 'libssl.so' 'libz.so' 'libzstd.so' 'tzdata' 'mpdecimal')
depends=("${_tauri_depends[@]}" "${_python_depends[@]}" 'hicolor-icon-theme')
makedepends=('npm' 'pyenv' 'cargo' 'git' 'autoconf-archive' 'automake')
conflicts=("$_pkgname")
provides=("$_pkgname")
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
            'dc5c95c0f5aed4d12870462f892ca574601c1d241cf5e70f54e6efaf9001ff3b'
            'e857d9ddb87b784c56122c53d9eb89ccbfcc5e211f6831b4159e3fe11095f5da'
            '6e05fca2f60b8026b51981f31446b2b2011b5461f959ec1c82129e7bda51ee6d'
            'cd6b79fc8da541d071f0072a55fed5005331706a5c70ae9e4c22ef6855983599'
            'a18f9ede8e089258603a79e3fba57a45f2f98289af9e09713fdc05c6bf87b47a'
            'a8ccb61517a2dd9dc8bc8807f01ead65134cf3dbd66cf976ec3226ea4575e733'
            '8f304819765df67513008b9f234efd52277206da2033827fad21b0a195692391'
            '6ac6e6dba2bf9829228886c9b6fc422ca89183412f04c3d9c3666226cd23cb1b'
            'ce3d700ce4a3e20077537a7dbb3befb45b172089d12c2eb0cc0b51a057a46219'
            '841a9fd040ba0d3691a0c5bd6cb6c53fe5a27dc2bb5f04c5af1bdf508b5d69f3'
            'f6ec0daf4271b649618b6e7bddc79b5ba1e433b1a32c333b903f09b53ebc20ae'
            'c6495d8530a36b4dab9a92c264c6e532a00d9d9a658145422c1fa78a61ab4692'
            '31722c9cff0ad36cee5a81b68eda86b9b30463e743f44561ea31df4078b85d91'
            '82438e4c5fa472144badef10b1dbdcdbf5313e079af46e23231be43e9c6b18cd')
b2sums=('SKIP'
        'cad6a467d8a181150062095d39ff5eff746fa90e7edca57da43e17b9c25b5371e6934ff08844c0b55feb02473a567fb9a55187738416eb3c4fdc12f82c7a3943'
        'dcb7152de750dc57fe188f43b4ef7d6bc24a9184862169a948da62523c7b509e4396780f7102d89bf9e31ba30f0e4b755db0bb8358c832e207ab069f176c50f3'
        'f0bc24ec33df831aadd9e614e3099d5749fbdcaf9979c0c78c0f0ee91a108790afa35c813e6ca195b65ff67f50fc1758092fbba5cf06af2f420ffe74111e4cf4'
        '8b0d2b8f9c8a6db7db70ccfc06980ce54ab04ae42ee4026cf38b72d02fc44a6f002c5ba5acba197fa61d3fcdb65c90a2afc471c5bcb4aff2296edd187e8f52cc'
        'f6202b7c24220f36f59a512abb9757f8c0f9bea35d3064f6f13a22e56245e614a2f453ed43a10e6b9e3baa20a944104d7a6dafb6385d57741281f60093efafb5'
        '1202055efdf0f49de8b192d45a0e16ecf88d5c07fac9eb9cc73961ed18cc84eff2088da36afeb870cdab4611a161394ef7714f01f800fb6cdbdd4c3608d6e983'
        '837bc2b7c3ee843235bec818e8a2f5188188626f42295bfb38e28d7bda11018add1dbfcebe8c7fb2fd5186a3a0b25f7b8534df28272dc7b00390050ae1606422'
        'c3910e5fb01d5ba65e8abc040e7ed16c3f37cc02f72c403bd36600d87550505188c6c893efdfff986a9bb5e0111aa917f2b8993522603487061d7c48c6668705'
        'ff68ca012f313d25a84577f8a6567bb71720624dee36b0e54b522dae89ba53aa51c8d7aac6e082cd3a442aa58e94fb574f76aa5d4b1ae9036b716b3f3bc88ac3'
        '5439e25390165985cd687e3e5bdb999c9d806d8dd4d8e78077d0d2d3269f6aee8099899b45966974a7d8d4d64b8631725fdd9decb6cef10bdf4544517a524c6b'
        '2676b344946aa8be35a5cc1f3f822bebb2365fa44b1fae317f1820b6377a0d7c676ebda1e05b3caef8218494febf7ec774712a0392c42c31ef950b22b129a4e6'
        '8414836083602c01510b26021811dc01c08872dbb40ad5c1f62f2065601ed8052af0c959a166f9f882430b60d02338be4cab43156112b801dbddebf935e3def8'
        '7bb8301814751a6b75f2ee0ded34084b5705c7af8fe56f2cf0b259f153a952b0fae7e0f877b8a4739a194e4c4ab490bcd13d69b678e7ebf369e7f8198a790b9c'
        'cc661ecd970724a77af1278ab20d7d3eafc22119fb94ff7e310ee3eeb68af67d8c88d9e1e38c49117b8a45fbaedef4a506798cbc63214370a76105877b24763d'
        'ba6c3b3b03b860665f4db26609ca70ddf678acd79b85a62285d1b512431e7aca312118721fb808721fdadeced146443020808548adce825fb22a4f7e954a1816')

if [ "${_vendored_portaudio:-}" = true ] && ! [ "${GENINTEG:-}" = 1 ]; then
    depends+=('libasound.so' 'libsndio.so' 'libjack.so' 'libpulse.so')
    source+=("git+https://github.com/PortAudio/portaudio.git")
    : && sha256sums+=('SKIP')
    : && b2sums+=('SKIP')
else
    depends+=('libportaudio.so')
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
        patch -Np1 -i "$patch"
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

    find src-tauri/target/release/_internal -type f -name '*.so' -exec chrpath --replace "\$ORIGIN:/opt/$_pkgname/_internal" \{\} \;
    find src-tauri/target/release/_internal -type f -name '*.so.*' -exec chrpath --replace "\$ORIGIN:/opt/$_pkgname/_internal" \{\} \;
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
