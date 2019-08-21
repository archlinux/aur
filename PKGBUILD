# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Maintainer: PedroHLC <root@pedrohlc.com>

# This PKGBUILD does not work without internet acces.

# The AUR repository contains just the files needed to build this package.
# For additional maintainer tools for this package, see:
# https://github.com/openglfreak/xamarin-android-arch

# Set this to true to include proprietary components.
# You can also set it as an environment variable.
#_include_proprietary=


pkgname=xamarin-android-git
pkgver=10.0.99.r2345.gd762aa99
pkgrel=1
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages (Git version)"
arch=('x86_64')
makedepends=('xmlstarlet'
             'ant'
             'cmake'
             'git'
             'gtk-sharp-2'
             'jdk8-openjdk'
             'libzip'
             'ninja'
             'nuget'
             'referenceassemblies-pcl'
             'unzip'
             'zip'
             'p7zip'
             'lsb-release')
depends=('msbuild'
         'mono>=3.0.0'
         'glibc>=2.28'
         'libzip>=1.5.1'
         'gcc-libs>=5.2'
         'lib32-gcc-libs>=5.2'
         'ncurses>=6'
         'zlib>=1:1.2.0')
optdepends=('jdk8-openjdk: For building Xamarin.Android Apps'
            'jdk8: For building Xamarin.Android Apps'
            'fsharp: For compiling Xamarin.Android F# projects')
provides=('xamarin-android')
conflicts=('xamarin-android')
url='https://github.com/xamarin/xamarin-android'
license=('MIT')
_android_source=('https://dl.google.com/android/repository/android-2.3.3_r02.zip' # src/xamarin-android/build-tools/xaprepare/xaprepare/ConfigAndData/Dependencies/AndroidToolchain.cs
                 'https://dl.google.com/android/repository/android-15_r05.zip'
                 'https://dl.google.com/android/repository/android-16_r05.zip'
                 'https://dl.google.com/android/repository/android-17_r03.zip'
                 'https://dl.google.com/android/repository/android-18_r03.zip'
                 'https://dl.google.com/android/repository/android-19_r04.zip'
                 'https://dl.google.com/android/repository/android-20_r02.zip'
                 'https://dl.google.com/android/repository/android-21_r02.zip'
                 'https://dl.google.com/android/repository/android-22_r02.zip'
                 'https://dl.google.com/android/repository/platform-23_r03.zip'
                 'https://dl.google.com/android/repository/platform-24_r02.zip'
                 'https://dl.google.com/android/repository/platform-25_r03.zip'
                 'https://dl.google.com/android/repository/platform-26_r02.zip'
                 'https://dl.google.com/android/repository/platform-27_r03.zip'
                 'https://dl.google.com/android/repository/platform-28_r04.zip'
                 'https://dl.google.com/android/repository/platform-29_r01.zip'
                 'https://dl.google.com/android/repository/docs-24_r01.zip'
                 'https://dl.google.com/android/repository/android_m2repository_r47.zip'
                 'https://dl.google.com/android/repository/sys-img/android/x86-29_r06.zip'
                 'https://dl.google.com/android/repository/android-ndk-r20-linux-x86_64.zip'
                 'https://dl.google.com/android/repository/build-tools_r29-linux.zip'
                 'https://dl.google.com/android/repository/platform-tools_r29.0.1-linux.zip'
                 'https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip'
                 'https://dl.google.com/android/repository/emulator-linux-5598178.zip'
                 'https://dl.google.com/android/repository/cmake-3.10.2-linux-x86_64.zip'
                 'https://d3pxv6yz143wms.cloudfront.net/8.222.10.1/amazon-corretto-8.222.10.1-linux-x64.tar.gz' # build-tools/xaprepare/xaprepare/ConfigAndData/Configurables.Linux.cs
                 'https://xamjenkinsartifact.azureedge.net/mono-sdks/android-release-Linux-cc0632e4f3252554b274ab49a6d67b1d14fa4e18.7z' # build-tools/xaprepare/xaprepare/ConfigAndData/Configurables.cs
                 'https://xamjenkinsartifact.azureedge.net/mono-sdks/android-release-Windows-cc0632e4f3252554b274ab49a6d67b1d14fa4e18.7z'
                 'https://dl.google.com/dl/android/maven2/com/android/tools/build/aapt2/3.4.1-5326820/aapt2-3.4.1-5326820-osx.jar' # src/aapt2/aapt2.targets
                 'https://dl.google.com/dl/android/maven2/com/android/tools/build/aapt2/3.4.1-5326820/aapt2-3.4.1-5326820-linux.jar'
                 'https://dl.google.com/dl/android/maven2/com/android/tools/build/aapt2/3.4.1-5326820/aapt2-3.4.1-5326820-windows.jar'
                 'https://github.com/google/bundletool/releases/download/0.10.0/bundletool-all-0.10.0.jar') # src/bundletool/bundletool.targets
source=('git+https://github.com/xamarin/xamarin-android.git'
        'git+https://github.com/mono/api-doc-tools.git'
        'git+https://github.com/mono/api-snapshot.git'
        'git+https://github.com/mono/aspnetwebstack.git'
        'binary-reference-assemblies::git+https://github.com/mono/reference-assemblies.git'
        'git+https://github.com/mono/bockbuild.git'
        'git+https://github.com/mono/boringssl.git'
        'git+https://github.com/mono/cecil.git'
        'git+https://github.com/mono/corefx.git'
        'git+https://github.com/mono/corert.git'
        'git+https://github.com/mono/debugger-libs.git'
        'git+https://github.com/dlfcn-win32/dlfcn-win32.git'
        'git+https://github.com/mono/helix-binaries.git'
        'git+https://github.com/mono/ikdasm.git'
        'ikvm::git+https://github.com/mono/ikvm-fork.git'
        'git+https://github.com/mono/illinker-test-assets.git'
        'Java.Interop::git+https://github.com/xamarin/java.interop.git'
        'git+https://github.com/nih-at/libzip.git'
        'git+https://github.com/xamarin/LibZipSharp.git'
        'git+https://github.com/mono/linker.git'
        'git+https://github.com/mono/llvm.git'
        'git+https://github.com/mono/Lucene.Net.Light.git'
        'git+https://github.com/witwall/mman-win32.git'
        'git+https://github.com/mono/mono.git'
        'git+https://github.com/jonpryor/mono.linq.expressions.git'
        'git+https://github.com/mono/Newtonsoft.Json.git'
        'nrefactory::git+https://github.com/icsharpcode/NRefactory.git'
        'nuget-buildtasks::git+https://github.com/mono/NuGet.BuildTasks.git'
        'nunit-lite::git+https://github.com/mono/NUnitLite.git'
        'git+https://github.com/mono/opentk.git'
        'git+https://github.com/xamarin/proguard.git'
        'git+https://github.com/mono/roslyn-binaries.git'
        'git+https://github.com/mono/rx.git'
        'git+https://github.com/icsharpcode/SharpZipLib.git'
        'git+https://github.com/xamarin/sqlite.git'
        'git+https://github.com/xamarin/xamarin-android-api-compatibility.git'
        'git+https://github.com/xamarin/xamarin-android-tools.git'
        'git+https://github.com/mono/xunit-binaries.git'
        "${_android_source[@]}"
        'https://dist.nuget.org/win-x86-commandline/v5.1.0/nuget.exe'
        Configuration.Override.props
        xaprepare-arch.patch)
noextract=("${_android_source[@]##*/}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '54bdb0f1ca06ba5747061ddeea20f431af72c448334fd4d3d7f84ea2ccd29fea'
            '5bc1f93aae86b4336ffc4cae9eb8ec41a9a8fd677582dd86a9629798f019bed9'
            'fd7f269a423d1f1d079eabf9f918ceab49108702a1c6bb2589d57c23393503d3'
            'b66e73fb2639f8c916fde4369aa29012a5c531e156dbb205fe3788fe998fbbe8'
            '166ae9cf299747a5faa8f04168f0ee47cd7466a975d8b44acaaa62a43e767568'
            '5efc3a3a682c1d49128daddb6716c433edf16e63349f32959b6207524ac04039'
            'ef08c453e16ab6e656cf5d9413ef61cb8c650607d33b24ee4ce08dafdfe965a7'
            'a76cd7ad3080ac6ce9f037cb935b399a1bad396c0605d4ff42f693695f1dcefe'
            '45eb581bbe53c9256f34c26b2cea919543c0079140897ac721cf88c0b9f6789e'
            '4b4bcddead3319708275c54c76294707bfaa953d767e34f1a5b599f3edd0076c'
            'f268f5945c6ece7ea95c1c252067280854d2a20da924e22ae4720287df8bdbc9'
            '9b742d34590fe73fb7229e34835ecffb1846ca389d9f924f0b2a37de525dc6b8'
            '2aafa7d19c5e9c4b643ee6ade3d85ef89dc2f79e8383efdb9baf7fddad74b52a'
            '020c4c090bc82ce87ebaae5d1a922e21b39a1d03c78ffa43f0c3e42fc7d28169'
            '967f8ca99b71d337aa9c7781f9d65dd8110bf5c4746f44304047bf71b20d0ded'
            '2c9e961858e03900ffa0801a4f6234aa7223363b629fd8e1be60da9aa09d86bd'
            '68db2690cb92e4ee5373ac9b792642c90717d8f417d83eccea48781171b3182a'
            'a3f91808dce50c1717737de90c18479ed3a78b147e06985247d138e7ab5123d0'
            'bc2e2d7a2c09c7f71122d7740f8020b869914127e7d67b6655094931ed95f6d9'
            '57435158f109162f41f2f43d5563d2164e4d5d0364783a9a6fab3ef12cb06ce0'
            '97d25d76d7ef5f545c5f034fd77479b56d2e846c59c03756178db99443741d8f'
            '16d2543ac5fb840e1e7c54735591fd0a9552cef128f3e14a9baffe9560acbc69'
            '92ffee5a1d98d856634e8b71132e8a95d96c83a63fde1099be3d86df3106def9'
            '523bf2fae0d93f19b93b0839243acadcca1d8cea8f3946f13651d6989dd1bb6d'
            '763572c87f77d3ddbf7e72d080e8b45184d5c368bfdd170f2589f08a089570fd'
            '293a5b6744558c5e7f520d4cfe27c89a053b8958d9dd3f32d1e95695ba29ab53'
            '2a5be870a09fdf0ba710b16f91190dd5e15f16756afb12d2cbf9e21d9cb0f96a'
            '9692e9f927f56813a8509667dd8ffc86ebced842ab65875412cef10f8736fd64'
            'a83c37de4891595fb2c1c5868d4485b7360bdfc0acb4a300aed201174f458420'
            '408852a986886f37e833ab75a6ec58771ee8f1154d477fc0d4d971a3b3951a33'
            'c7d5f5085f918e9a38a328857beb8e599ca907ebfc2edd553222c99dc20e33e1'
            '4070cbd35c7c8f868864f9d85cab19f8feb4f3982d846c509b9e210a6ec23457'
            '0ace4f53493332c9a75291ee96acd76b371b4e687175e4852bf85948176d7152'
            'c633ea19a84a5b638fb60d6421d8c2b10fdd6f1a5b455c4f0fe0fa0b0628878b'
            '809792dbe7384634e82406b724c3f4f452af0c536f75bf115deb93aa682a7142')

if [ true = "${_include_proprietary}" ]; then
    pkgname=xamarin-android-proprietary-git
    pkgdesc="$pkgdesc (Including proprietary components)"
    source+=('https://download.visualstudio.microsoft.com/download/pr/8a466e79-1ee5-4ec8-9651-1bc87a28816f/494e153cbe0307c47f0e3c0ad015d01f/xamarin.android.sdk-10.0.0.4.vsix'
             runtime-xml.patch)
    sha256sums+=('fd91ddd271d05933fdef7ee7fba85191520138c3af7edf79fb5c52a70ccf773a'
                 '353d503f404294812040cbaf9c2183f25e62fd56f06cc205ae25eee5f3ae0887')
    provides+=('xamarin-android-git')
    conflicts+=('xamarin-android-git')
fi

pkgver() {
    local ProductVersion _VCSVersion VCSVersion CommitCount CommitHash
    cd "${srcdir}/xamarin-android"

    ProductVersion="$(xml sel -N msb='http://schemas.microsoft.com/developer/msbuild/2003' -t -v '/msb:Project/msb:PropertyGroup/msb:ProductVersion' ./Configuration.props)"

    if _VCSVersion="$(git describe --long --tags 2>/dev/null)"; then
        VCSVersion="$(printf '%s' "${_VCSVersion}" | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
    else
        CommitCount="$(git rev-list --count HEAD)"
        CommitHash="$(git rev-parse --short HEAD)"
        VCSVersion="r${CommitCount}.g${CommitHash}"
    fi

    printf '%s.%s\n' "${ProductVersion}" "${VCSVersion}"
}

_prepare_Java_Interop() {
    local Submodules
    cd external/Java.Interop

    Submodules=(cecil
                xamarin-android-tools)

    for Submodule in "${Submodules[@]}"; do
        git submodule init "external/${Submodule}"
        git config "submodule.external/${Submodule}.url" "${srcdir}/${Submodule}"
        git submodule update "external/${Submodule}"
    done
    git submodule init 'lib/mono.linq.expressions'
    git config 'submodule.lib/mono.linq.expressions.url' "${srcdir}/mono.linq.expressions"
    git submodule update 'lib/mono.linq.expressions'

    cd ../..
}

_prepare_mono() {
    local Submodules

    Submodules=(Newtonsoft.Json
                api-doc-tools
                api-snapshot
                aspnetwebstack
                bockbuild
                boringssl
                cecil
                corefx
                corert
                helix-binaries
                ikdasm
                ikvm
                illinker-test-assets
                linker
                llvm
                nuget-buildtasks
                nunit-lite
                roslyn-binaries
                rx
                xunit-binaries)

    for Submodule in "${Submodules[@]}"; do
        git submodule init "external/${Submodule}"
        git config "submodule.external/${Submodule}.url" "${srcdir}/${Submodule}"
        git submodule update "external/${Submodule}"
    done
    git submodule init "external/cecil-legacy"
    git config "submodule.external/cecil-legacy.url" "${srcdir}/cecil"
    git submodule update "external/cecil-legacy"
    git submodule init "external/binary-reference-assemblies"
    git config "submodule.external/reference-assemblies.url" "${srcdir}/binary-reference-assemblies"
    git submodule update "external/binary-reference-assemblies"

    cd external/api-doc-tools

    git submodule init "external/Lucene.Net.Light"
    git config "submodule.external/Lucene.Net.Light.url" "${srcdir}/Lucene.Net.Light"
    git submodule update "external/Lucene.Net.Light"
    git submodule init "external/SharpZipLib"
    git config "submodule.external/SharpZipLib.url" "${srcdir}/SharpZipLib"
    git submodule update "external/SharpZipLib"

    cd ../..

    cd external/linker

    git submodule init "external/cecil"
    git config "submodule.cecil.url" "${srcdir}/cecil" # Why is this different?
    git submodule update "external/cecil"

    cd ../..
}

_prepare_submodules() {
    local Submodules
    Submodules=(Java.Interop
                LibZipSharp
                debugger-libs
                dlfcn-win32
                libzip
                mman-win32
                nrefactory
                opentk
                proguard
                sqlite
                xamarin-android-api-compatibility
                xamarin-android-tools)

    for Submodule in "${Submodules[@]}"; do
        git submodule init "external/${Submodule}"
        git config "submodule.external/${Submodule}.url" "${srcdir}/${Submodule}"
        git submodule update "external/${Submodule}"

        if declare -Ffp "_prepare_${Submodule//[^0-9A-Za-z_]/_}" > /dev/null 2>&1; then
            "_prepare_${Submodule//[^0-9A-Za-z_]/_}"
        fi
    done

    if [ -e mono ]; then
        cd mono
        git fetch --all
    else
        git clone "${srcdir}/mono" mono
        cd mono
    fi
    _prepare_mono
    cd ..
}

prepare() {
    local AndroidSourceArchives ProprietaryParams
    cd "${srcdir}/xamarin-android"

    _prepare_submodules

    mkdir -p "${srcdir}/xamarin-android/.nuget"
    mv "${srcdir}/nuget.exe" "${srcdir}/xamarin-android/.nuget/NuGet.exe"
    mv "${srcdir}/Configuration.Override.props" "${srcdir}/xamarin-android/"

    # Add Arch Linux support to xaprepare.
    git -C "${srcdir}/xamarin-android" apply "${srcdir}/xaprepare-arch.patch"

    mkdir -p "${srcdir}/android-archives"
    AndroidSourceArchives=("${_android_source[@]##*/}")
    mv "${AndroidSourceArchives[@]/#/${srcdir}/}" "${srcdir}/android-archives/"

    # The aapt2 archives have to be renamed for some reason.
    for Aapt2Archive in "${srcdir}/android-archives"/aapt2-*.jar; do
        mv "${Aapt2Archive}" "${Aapt2Archive%.jar}.zip"
    done

    # TODO: download bundle and move it to "${srcdir}/android-archives/"
    # The bundle currently 404's.

    if [ true = "${_include_proprietary}" ]; then
        mv "${srcdir}/\$MSBuild/Xamarin/Android" "${srcdir}/Xamarin.Android"
        rm -rf "${srcdir}/"{Resources,_rels,package,\$ReferenceAssemblies,\$MSBuild,Xamarin.Android.Sdk.pkgdef,Xamarin.Android.Sdk.dll,ThirdPartyNotices.txt,manifest.json,extension.vsixmanifest,\[Content_Types\].xml,catalog.json}

        # Fixes proprietary .xml files not being copied.
        git -C "${srcdir}/xamarin-android" apply "${srcdir}/runtime-xml.patch"
    fi

    if [ true = "${_include_proprietary}" ]; then
        # This breaks if srcdir includes a single quote
        ProprietaryParams=(PREPARE_MSBUILD_FLAGS="/p:_SourceDir='${srcdir}/Xamarin.Android/' /p:XAIncludeProprietaryBits=True" MSBUILD_FLAGS="/p:_SourceDir='${srcdir}/Xamarin.Android/' /p:XAIncludeProprietaryBits=True")
    fi

    TERM=dumb srcdir="${srcdir}" make prepare PREPARE_ARGS='--no-emoji --run-mode=CI' ${ProprietaryParams+"${ProprietaryParams[@]}"} CONFIGURATION=Release
}

build() {
    local ProprietaryParams
    cd "${srcdir}/xamarin-android"

    if [ true = "${_include_proprietary}" ]; then
        # This breaks if srcdir includes a single quote
        ProprietaryParams=(PREPARE_MSBUILD_FLAGS="/p:_SourceDir='${srcdir}/Xamarin.Android/' /p:XAIncludeProprietaryBits=True" MSBUILD_FLAGS="/p:_SourceDir='${srcdir}/Xamarin.Android/' /p:XAIncludeProprietaryBits=True")
    fi

    # Basically make jenkins but without all the Windows stuff
    TERM=dumb srcdir="${srcdir}" make all ${ProprietaryParams+"${ProprietaryParams[@]}"} CONFIGURATION=Release
    TERM=dumb srcdir="${srcdir}" make -f Makefile -f bin/BuildRelease/rules.mk framework-assemblies _MSBUILD_ARGS= ${ProprietaryParams+"${ProprietaryParams[@]}"} CONFIGURATION=Release
    TERM=dumb srcdir="${srcdir}" make -f Makefile opentk-jcw _MSBUILD_ARGS= ${ProprietaryParams+"${ProprietaryParams[@]}"} CONFIGURATION=Release
}

package() {
    cd "${srcdir}/xamarin-android"

    if [ true = "${_include_proprietary}" ]; then
        # This breaks if srcdir includes a single quote
        ProprietaryParams=(PREPARE_MSBUILD_FLAGS="/p:_SourceDir='${srcdir}/Xamarin.Android/' /p:XAIncludeProprietaryBits=True" MSBUILD_FLAGS="/p:_SourceDir='${srcdir}/Xamarin.Android/' /p:XAIncludeProprietaryBits=True")
    fi

    TERM=dumb srcdir="${srcdir}" make install prefix="${pkgdir}/usr" ${ProprietaryParams+"${ProprietaryParams[@]}"} CONFIGURATION=Release

    # Correct links
    find "${pkgdir}" -type l -exec sh -c 'prefix="${1}"; shift; for link; do target="$(readlink "${link}"; echo x)"; target="${target%?x}"; new_target="${target#${prefix}}"; if [ "${new_target}" != "${target}" ]; then rm -f "$link"; ln -s "$new_target" "$link"; fi; done' x "${pkgdir}" \{\} \+;
    # build-tools/debian-metadata/rules
    rm -f "${pkgdir}"/usr/lib/xamarin.android/xbuild/Xamarin/Android/cross-*.exe*
    rm -f "${pkgdir}"/usr/lib/xamarin.android/xbuild/Xamarin/Android/*-as.exe*
    rm -f "${pkgdir}"/usr/lib/xamarin.android/xbuild/Xamarin/Android/llc.exe
    rm -f "${pkgdir}"/usr/lib/xamarin.android/xbuild/Xamarin/Android/opt.exe
    rm -f "${pkgdir}"/usr/lib/xamarin.android/xbuild/Xamarin/Android/aapt2.exe
    rm -f "${pkgdir}"/usr/lib/xamarin.android/xbuild/Xamarin/Android/libwinpthread-1.dll
    rm -f "${pkgdir}"/usr/lib/xamarin.android/xbuild/Xamarin/Android/libzip.dll
}
