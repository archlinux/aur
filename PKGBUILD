# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: David Strawn <isomarcte a__t gmail d__o__t c__o__m>
pkgname='metals'
pkgver='0.5.0'
pkgrel=5
epoch=
pkgdesc='Language Server For Scala'
url='https://scalameta.org/metals/'
arch=(any)
license=('Apache')
groups=()
depends=('java-environment=8' 'findutils' 'python')
makedepends=('sbt' 'sed' 'grep' 'coreutils')
checkdepends=()
optdepends=('bloop')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/scalameta/${pkgname}/archive/v${pkgver}.tar.gz" 'metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh' 'version-fix.patch')
noextract=()
md5sums=('1893a9e8e8a26431904cced138d8e26d'
         '1edc7a3c2859f1f43030d290fdd14605'
         '35d1ad5299a50a57b0e9ce01e8db2621'
         'b0051c6a23d854d238d8c1537d6d21e9'
         'd663f1f270728007737fc92eba3cdda6'
         '8de373e4b778d505ed7b4013f6de3f7d'
         '1228820359ad5d636e56db35349350f4')
sha1sums=('8370cb58637a47d0640f4f619c95207374cb5eb7'
          '38c63ddc9a1712faa06082ffa0f62acec9907a12'
          'ecbbc90be3f1c928a124369db19a89f58ef24e20'
          '8ff3e8e501179951134c0928fe786cec7b4540f3'
          '980c5f8a923b06f7913e76d373e52f32c6ed5e23'
          '2bac08ea1701ed7ff62a8c7edd0e554a6645ad05'
          'feaf909569c00776b67e8d5315332ae3dc02a8b2')
sha224sums=('24546483700bda5d64cd135bc3d7d53a34b33376ec8a4502c5335385'
            '3ada0159bda461f0d690fd3a04e19273c5bf6b719a5bc5a7f5ed57dc'
            '21773611c91f73cdf2571f77bf88826bd146e99acd5be4d407e8d8ab'
            '212589cddda77208afed3ce3e5d637b7371de29678a5b4268b8813ba'
            '3bd9d54fa01af4ee558440c15825e4a3f4e0cd23e2c625f415b887c7'
            'c2aa07b9a5183f5c2838edb170c9e8ebeac3c82ed2ea5f63e6b39889'
            '702ee997e46be69bca262c1be3867203ccb4454df859b8b9ca323d74')
sha256sums=('57f61352e382cef8c53a674307fcc8aab1d2b44719831830a9d899dbf14f197c'
            '428d5e71f6bee7e8cd522bb5978ca0df9f0099b9554e97398945fa122f8d3b01'
            '477e4e3cb1a1b20afaec654a837bbe15a3269bc7dd657ff5832187104463fbfa'
            '5cd20fa0cd8cd12faa08caca4a4b871b378e8a1694399656a15ca4694ada9f2c'
            '95a05219364440e488f12c173da3516e20ccf4ca4076cdaa1eb3c7b0bf813270'
            'cb350148b06cc3ee283b456488d8af9613e07305f3ae4032874c6a1b9f73fa8f'
            '510bab61855505e4e301f98c2b44259964803ced3799fb9fb3d5bc180ba765f9')
sha384sums=('871a1da43a17de6a7251c0c7c1ae19bf6aa85f293249674ffa535803a75bfcc14714cf19fc6ea0956bdb00f94332517d'
            '27d5b5e691813140340e18f1468c301747b91aa721f7434c3c898b92d3ee81ccf686eb45373ab68db440aa9f0b32a749'
            '43ba683998bbf95934c930ce8e120072ecaba251ba0ece24e9eeff7aa5d9b7d9af6aecac3645f8381252f1c0055ec67f'
            'd2cba883c4a9cebb0676583dd62f7870ac73d264ba96b74419f510e528c0f9268ab62356165c74f361078fe507098613'
            'c99e9d2000c8201de9d608903406214e0d2ad27ee52ff083e5b28b79c83ade7aca79e80a592438fdf1aab179968d6cbe'
            'be07a2f5bad7a95502126ab453821a916ec88c3af1513a3840f2a4306bd7f3eac741f1b065adab9bb2bb23e849f77981'
            '24ae61e7e62d5b2944093cc1273b9be3a813db436ffe44769e5dbe0dc37f085492950389e0324285bd149c4d818f79ca')
sha512sums=('21d6bd645ad35b749374b76015e7019375e2723b4e4e1b25dc0a983591f475c5466f1b6840a90b8dcd582e870a25f7d8296c04da8ec6e780512f0a5b53c6dd5c'
            'c04c63c959bdab9dc9fefd278a750e08757661bbdf685a078ffd7b7804c1b1c05988aa17fe8d00cd616bc5ff54c137b8774bda66e644c3a385d5950125ce278a'
            '255ac4d9856eed88a6c1b7bcdc51a6e3b434718754b4476e474eac5e3298be65ad1385672132fcb128402e912a2c792438e23323fbf9a2cfa0d282f105105567'
            '8d12ffc5eed49fdc8b16682843377f06955d22dddfb72de814237cfdcf7ca6a42e622c3cfd9d0a9f0fd4f46a4c1f05c7bcb69541e9fcb4f8ba16915d19b523f8'
            '62702baaffd37a562649032d6cc45756a1829876e4b812815483e704457fcefb19849aa5977d729d572c22592da04e87e1e2effa295b797603535527046d1c7a'
            '15d663103edfca27d517c8161914074e4d90fbb069bbf692c1e68d39d9a8157c5878dcd6926481841b732cf4eb3299c42789aef1fe5ec2442aaeba7cf29d185f'
            'b4a4eb0bde4045de411b639e16cf41b95e3e50d8950c3a48008d42b60751541e4957c463f4f817320f15488c702d52fb977d3fe63d8832d55f259907f7e0afcf')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"

    # The build currently does not set the correct version unless
    # built from git with the environment variable CI set. See
    # https://github.com/scalameta/metals/issues/662
    patch -p1 -i ../version-fix.patch
}

build() {
    export COURSIER_CACHE="./.cache/coursier/v1"
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT

    local -r _SBT_DIR="./.sbt"
    local -r _SBT_IVY="./.ivy2"
    cd "$pkgname-$pkgver"

    # When run with some AUR helpers, in particular `yay`, for a
    # reason I do not understand `sbt` will regularly attempt to
    # resolve the Scala compiler in a local-preloaded-ivy cache
    # _only_, and not attempt to download it. However if you just run
    # it again, it then tries to download it. This does not happen
    # when run locally, for me at least, with makepkg or in a
    # systemd-nspawn with extra-x86_64-build.
    sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" clean compile || sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" clean compile
}

check() {
    export COURSIER_CACHE="./.cache/coursier/v1"
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT

    local -r _SBT_DIR="./.sbt"
    local -r _SBT_IVY="./.ivy2"
    cd "$pkgname-$pkgver"
    ## Tests on most recent release currently fail
    # sbt test
}

package() {
    export COURSIER_CACHE='./.cache/coursier/v1'
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT

    ## Constants ##
    local -r _SBT_DIR='./.sbt'
    local -r _SBT_IVY='./.ivy2'
    local -r _TARGET_DIR='/usr/share/java/metals'
    local -r _DEST_DIR="${pkgdir}${_TARGET_DIR}"
    local -r _BIN_DEST_DIR="${_DEST_DIR}/bin"
    local -r _LIB_DEST_DIR="${_DEST_DIR}/lib"
    local -r _JAR_DEST_DIR="${_DEST_DIR}/jars"
    local -r _USR_BIN="${pkgdir}/usr/bin"
    local -r _TEMP_FILE="$(mktemp)"
    local -r _LAUNCHER_SCRIPTS=('metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh')

    ## Change Into Correct Directory ##
    pushd "$pkgname-$pkgver"

    ## Create lib And bin Directories ##
    install -d "$_LIB_DEST_DIR"
    install -d "$_BIN_DEST_DIR"

    ## Install Class Files And Jars ##

    ### Determine Dependencies ###

    # If you're reading this and you know of a better way to get all
    # the dependencies from SBT directly, please let me know.
    sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" compile 'show metals/dependencyClasspath' 2>/dev/null | grep Attributed | sed 's/^[^\*]\+\* Attributed(\([^)]\+\).*/\1/g' > "$_TEMP_FILE"
    while read dep
    do
        local _SANATIZED_DEP="${dep##*${pkgname}-${pkgver}/}"
        # Sort out directories from modules from third-party jars.
        if [ -d "$_SANATIZED_DEP" ]
        then
            pushd "$_SANATIZED_DEP"
            cp -r ./* "${_LIB_DEST_DIR}/"
            popd
        else
            if [ ! -e "$_JAR_DEST_DIR" ]
            then
               install -d "${_JAR_DEST_DIR}"
            fi
            local _JAR_PATH="${dep##*/maven2}"

            install -D "$_SANATIZED_DEP" "${_JAR_DEST_DIR}${_JAR_PATH}"
        fi
    done<"$_TEMP_FILE"

    ## Install Metals Class Files ##

    install -d "${_DEST_DIR}/metals"
    pushd 'metals/target/scala-2.12/classes'
    cp -r ./*  "${_DEST_DIR}/metals/"
    popd

    ## Install And Symlink Launcher Scripts ##
    for launcher in ${_LAUNCHER_SCRIPTS[@]}
    do
        local _LINK_NAME="${launcher##*/}"
        _LINK_NAME="${launcher%%.*}"
        if [ ! -e "$_USR_BIN" ]
        then
            install -d "${_USR_BIN}"
        fi
        install -m 755 "../${launcher}" "$_BIN_DEST_DIR"
        ln -s "${_TARGET_DIR}/bin/${launcher}" "${_USR_BIN}/${_LINK_NAME}"
    done

    ## Ensure Correct Permissions ##

    chown root:root -R "$_DEST_DIR"
    chmod u=rwX -R "$_DEST_DIR"
    chmod u=rwX -R "$_BIN_DEST_DIR"
    chmod og=rX -R "$_DEST_DIR"

    ## Cleanup ##
    rm "$_TEMP_FILE"
    popd
}
