# Maintainer: Masterisk-F <masterisk-f [at] proton DOT me>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

# UT 辞書のプロジェクトページ: https://utuhiro78.github.io/linuxplayers/mozc-ut.html

ENABLED_DICTIONARIES=(
    'alt-cannadic'
    'edict2'
    'jawiki'
    'neologd'
    'personal-names'
    'place-names'
    'skk-jisyo'
    'sudachidict'
)

pkgname=fcitx5-mozkey-ibg-ut
pkgver=0.10.4
pkgrel=1
pkgdesc='Mozkey IbG Japanese input method for Fcitx 5 with UT dictionaries'
arch=('x86_64')
url='https://github.com/kazormia296/mozkey-ibg'
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND CC0-1.0 AND CC-BY-2.5 AND CC-BY-SA-3.0 AND CC-BY-SA-4.0 AND GFDL-1.3-only AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT AND NAIST-2003 AND Unicode-3.0 AND LicenseRef-Okinawa-Dictionary')
depends=('fcitx5' 'hicolor-icon-theme' 'llama-cpp' 'qt6-base')
makedepends=('git' 'bazelisk' 'python' 'gettext' 'bzip2' 'pkg-config')
provides=('mozkey-ibg=0.10.4' 'fcitx5-mozkey-ibg=0.10.4')
conflicts=('mozkey-ibg' 'mozkey-ibg-bin' 'fcitx5-mozkey-ibg')
options=('!debug' '!strip')
source=(
    "mozkey-ibg::git+https://github.com/kazormia296/mozkey-ibg.git#tag=v${pkgver}"
    # UT dictionary
    'git+https://github.com/utuhiro78/merge-ut-dictionaries.git#commit=15c1c64502b43e31d328012860376c03c3eaf633'
    'git+https://github.com/utuhiro78/mozcdic-ut-alt-cannadic.git#commit=08e033f4558b7a0b03d8ad6920216d9473f15627'
    'git+https://github.com/utuhiro78/mozcdic-ut-edict2.git#commit=d7279ba285fd5ddfe158b0bfd0c4fcda1f7b08c3'
    'git+https://github.com/utuhiro78/mozcdic-ut-jawiki.git#commit=b50cabaecaf32c03d102db55fc5d0b98e334ec9e'
    'git+https://github.com/utuhiro78/mozcdic-ut-neologd.git#commit=d8307abf02b830b185c9320822cffa0d0787c54e'
    'git+https://github.com/utuhiro78/mozcdic-ut-personal-names.git#commit=5896ebef5f39d5772f4575fa05eb24436ce5a5f1'
    'git+https://github.com/utuhiro78/mozcdic-ut-place-names.git#commit=6f9d9bda14f0bd2c10c1563d2aed9150ea95095c'
    'git+https://github.com/utuhiro78/mozcdic-ut-skk-jisyo.git#commit=7c02e535bd6d999a715a53b58c3366f2401bfb7f'
    'git+https://github.com/utuhiro78/mozcdic-ut-sudachidict.git#commit=7def3da408b1854801bd5b559273f9fb8001ef5b'
    'https://dumps.wikimedia.org/jawiki/20260601/jawiki-20260601-pages-articles-multistream-index.txt.bz2')
noextract=('jawiki-20260601-pages-articles-multistream-index.txt.bz2')
b2sums=('33d7df80a31ed7bb126949fd0f995ff08c41753d15062ecb7a2bf058c5855685d60963270d4a77ffe351e7a9ee8e9acb83a5a2a4ab6f98401d493ebc7440e978'
        '84150b8d743335d4b2801d15b74640380da0cfb95815bfc32a98f48f0fc7ac25b98ab417afee715c87a70dd8127568bd999e8e6a2c17da09d2a560fcdba030d3'
        'f320adaf559ad3b51cb323c19f1ac0155f33f1b59939bfc34577f429cfc64d589271c5b6a9fe481fa7be6b97e7043832b0b7bf339e0559a836fa5a1b62101f5d'
        'e9555a886657f237a55552f8f8aec769f0522cb54b4765f805ec1cd06dc80d8e8f735c35099132471bb46bda8219cf2991f6357b2cca5df24ff38f63c5d8f331'
        '55a45669af70fa125127f27298f161180e7e6c4869611f6dc7a89416f0e82ed99453bdf87f674f5cd860acd174ab0ee14d3551d02fc1c2aa6ee8c38abb993a92'
        '2eca0fd11c44091b2cf0a59de232a8d9b30e6c0a16cb4ece11d8a9f54457fe14b7ec9dd58aa1e67828df113d83a46b077a80b683333dc23a28617fbb3fe13fd0'
        '83746b7d3b3cfe66e5f3b931abaf907fd37071a003d22e4d0cb065f91f554f33533104ed3b4dbe58840cdcb438dfa69882ea099fcfbfd0e8df0cf28417ae60a7'
        'a93db79ae5e75ede45217f6a3feaf2982f2c948dfe4a0695854339f6baceda1358bf98f6118c4b7291fe2a11670e4e0e4c4164328fa03e9bad6aa7fd20bf54a5'
        '1add7e57200df1899f48e0a0ba03351523c121eee95068aa7e332c3a3967089d78c4146ffd4528f0513b2228fbd2cfb72661b41427a6e3330b275edb83e23bbd'
        '602388543678e45d4703e6165d718265a2a9e1a6f4c5359aa090ccd6eaa901d2f329da72814fc0064e9b08b936f70a0291d29da09b5d1ef68aa272058f589d44'
        'cd4c02ee67d98084b6e4909eea77ca464d3cca838595538c5219710927aa42630fa67110f45297252c11f8e8c84d5a3c346a378b848d86ca14b4eb84505c1f74')

prepare() {
    cd "${srcdir}/merge-ut-dictionaries/src/merge/"

    # 固定したローカルスナップショット（mozkey-ibg ソースと jawiki dump）を使う。
    # merge_dictionaries.py は本来 Google の mozc-master.zip を取得するため、
    # mozc-ut と同じ要領でローカルファイルを参照するよう書き換える。
    sed -i -e "s|mozc-master/src/data/dictionary_oss|${srcdir}/mozkey-ibg/src/data/dictionary_oss|g ;
               84s|ZipFile(f'mozc-{date_str}\.zip') as zip_ref|open('merge_dictionaries\.py') as dummy_ref| ;
               86s|zip_ref\.|| ;
               96s|zip_ref\.namelist()|os\.listdir(path='${srcdir}/mozkey-ibg/src/data/dictionary_oss')| ;
               104s|zip_ref\.|| ;
               169s|jawiki_index_file = .*|jawiki_index_file = '${srcdir}/jawiki-20260601-pages-articles-multistream-index.txt.bz2'| ;
               152,168d;89,90d;80,83d;67,79d ;
               7i import os" merge_dictionaries.py

    # UT 辞書をコンパイルする
    printf '\nCompiling the UT dictionary...\n\n'

    [[ -e mozcdic-ut.txt ]] && rm mozcdic-ut.txt

    for dict in "${ENABLED_DICTIONARIES[@]}"
    do
        bzip2 -dfk "${srcdir}"/mozcdic-ut-${dict}/mozcdic-ut-${dict}.txt.bz2
        cat "${srcdir}"/mozcdic-ut-${dict}/mozcdic-ut-${dict}.txt >> mozcdic-ut.txt
    done

    python merge_dictionaries.py mozcdic-ut.txt

    # UT 辞書を mozkey-ibg のベース辞書へ追記する
    cat mozcdic-ut.txt >> "${srcdir}"/mozkey-ibg/src/data/dictionary_oss/dictionary00.txt
}

build() {
    cd "${srcdir}/mozkey-ibg"

    # コミット済みの Zenz GGUF はそのままでは llama.cpp が拒否するため、
    # 上流の正規化ツールで llama.cpp 互換のメタデータへ変換して dist/ に生成する。
    python3 tools/release/normalize_zenz_gguf.py create --root .

    cd src
    bazelisk build \
        //unix/fcitx5:fcitx5-mozkey-ibg.so \
        //unix/fcitx5:grimodex_consumer_tool \
        //server:mozc_server \
        //gui/tool:mozc_tool \
        //zenz_scorer:mozc_zenz_scorer \
        --config=oss_linux \
        --config=release_build \
        --config=no_sframe \
        --//unix/fcitx5:use_server=true
}

package() {
    cd "${srcdir}/mozkey-ibg"

    addon_dir="$(pkg-config --variable=libdir Fcitx5Core)/fcitx5"

    # サーバ本体・ツール・zenz scorer（製品固有の private libexec path）
    install -Dm755 src/bazel-bin/server/mozc_server \
        "${pkgdir}/usr/lib/mozkey-ibg/mozc_server"
    install -Dm755 src/bazel-bin/gui/tool/mozc_tool \
        "${pkgdir}/usr/lib/mozkey-ibg/mozc_tool"
    install -Dm755 src/bazel-bin/zenz_scorer/mozc_zenz_scorer \
        "${pkgdir}/usr/lib/mozkey-ibg/mozc_zenz_scorer"
    install -Dm755 src/bazel-bin/unix/fcitx5/grimodex_consumer_tool \
        "${pkgdir}/usr/lib/mozkey-ibg/unregister-grimodex-consumer"

    # fcitx5 アドオン本体
    install -Dm755 src/bazel-bin/unix/fcitx5/fcitx5-mozkey-ibg.so \
        "${pkgdir}${addon_dir}/fcitx5-mozkey-ibg.so"

    # fcitx5 メタデータ
    install -Dm644 src/unix/fcitx5/mozkey-ibg-addon.conf \
        "${pkgdir}/usr/share/fcitx5/addon/mozkey-ibg.conf"
    install -Dm644 src/unix/fcitx5/mozkey-ibg.conf \
        "${pkgdir}/usr/share/fcitx5/inputmethod/mozkey-ibg.conf"
    msgfmt --xml -d src/unix/fcitx5/po/ \
        --template src/unix/fcitx5/io.github.kazormia296.MozkeyIbG.metainfo.xml.in \
        -o src/unix/fcitx5/io.github.kazormia296.MozkeyIbG.metainfo.xml
    install -Dm644 src/unix/fcitx5/io.github.kazormia296.MozkeyIbG.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/io.github.kazormia296.MozkeyIbG.metainfo.xml"

    # アドオン設置ディレクトリの記録（上流の fcitx5-addon-dir 相当）
    install -d "${pkgdir}/usr/share/mozkey-ibg"
    printf '%s\n' "${addon_dir}" > "${pkgdir}/usr/share/mozkey-ibg/fcitx5-addon-dir"

    # 翻訳
    for pofile in src/unix/fcitx5/po/*.po
    do
        lang="$(basename "${pofile}" .po)"
        install -d "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES"
        msgfmt "${pofile}" -o \
            "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/fcitx5-mozkey-ibg.mo"
    done

    # アイコン（hicolor）
    local icon_dir="${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 src/data/images/product_icon_32bpp-128.png \
        "${icon_dir}/128x128/apps/org.fcitx.Fcitx5.fcitx_mozkey_ibg.png"
    install -Dm644 src/data/images/unix/ime_product_icon_opensource-32.png \
        "${icon_dir}/32x32/apps/org.fcitx.Fcitx5.fcitx_mozkey_ibg.png"

    local ui_name ui_dest
    for pair in 'alpha_full:alpha_full' 'alpha_half:alpha_half' 'direct:direct' \
                'hiragana:hiragana' 'katakana_full:katakana_full' \
                'katakana_half:katakana_half' 'dictionary:dictionary' \
                'properties:properties' 'tool:tool'
    do
        ui_name="${pair%%:*}"
        ui_dest="${pair##*:}"
        install -Dm644 "scripts/icons/ui-${ui_name}.png" \
            "${icon_dir}/48x48/apps/org.fcitx.Fcitx5.fcitx_mozkey_ibg_${ui_dest}.png"
    done

    ln -sf org.fcitx.Fcitx5.fcitx_mozkey_ibg.png \
        "${icon_dir}/128x128/apps/fcitx_mozkey_ibg.png"
    ln -sf org.fcitx.Fcitx5.fcitx_mozkey_ibg.png \
        "${icon_dir}/32x32/apps/fcitx_mozkey_ibg.png"
    for pair in 'alpha_full:alpha_full' 'alpha_half:alpha_half' 'direct:direct' \
                'hiragana:hiragana' 'katakana_full:katakana_full' \
                'katakana_half:katakana_half' 'dictionary:dictionary' \
                'properties:properties' 'tool:tool'
    do
        ui_dest="${pair##*:}"
        ln -sf "org.fcitx.Fcitx5.fcitx_mozkey_ibg_${ui_dest}.png" \
            "${icon_dir}/48x48/apps/fcitx_mozkey_ibg_${ui_dest}.png"
    done

    # Zenz（ローカル AI 補正）モデルと llama-server シンボリックリンク
    install -Dm644 dist/zenz/linux/zenz-v3.2-small-Q5_K_M.gguf \
        "${pkgdir}/usr/lib/mozkey-ibg/models/zenz-v3.2-small-Q5_K_M.gguf"
    ln -sf /usr/bin/llama-server \
        "${pkgdir}/usr/lib/mozkey-ibg/llama-server"

    # ライセンス・通知（上流が持っているファイルのみをそのまま同梱する）
    local licdir="${pkgdir}/usr/share/licenses/${pkgname}"

    # Mozc (BSD-3-Clause) と Fcitx5 アダプタ（BSD-3-Clause / LGPL）
    install -Dm644 LICENSE "${licdir}/Mozc-LICENSE.txt"
    install -Dm644 LICENSES/Fcitx5-Mozc-BSD-3-Clause.txt \
        "${licdir}/Fcitx5-Mozc-BSD-3-Clause.txt"
    install -Dm644 LICENSES/LGPL-2.1-or-later.txt \
        "${licdir}/LGPL-2.1-or-later.txt"
    install -Dm644 THIRD_PARTY_NOTICES.md \
        "${licdir}/THIRD_PARTY_NOTICES.md"

    # UT 辞書ごとのライセンス（ソースリポジトリ付属の LICENSE をそのまま同梱）
    for dict in "${ENABLED_DICTIONARIES[@]}"
    do
        install -Dm644 "${srcdir}/mozcdic-ut-${dict}/LICENSE" \
            "${licdir}/ut/${dict}-LICENSE.txt"
    done

    # Zenz ランタイム / 辞書パイプラインの通知・ライセンス
    install -Dm644 src/win32/installer/zenz_runtime/licenses/Apache-2.0.txt \
        "${licdir}/dictionary/Apache-2.0.txt"
    install -Dm644 tools/dictionary/RELEASE_THIRD_PARTY_NOTICES.md \
        "${licdir}/dictionary/THIRD_PARTY_NOTICES.md"
    install -Dm644 tools/dictionary/daily_sources.lock.json \
        "${licdir}/dictionary/daily_sources.lock.json"
    for zenz_license in \
        zenz-v3.2-small-gguf.txt \
        llama.cpp-MIT.txt \
        cpp-httplib-MIT.txt \
        nlohmann-json-MIT.txt \
        Apache-2.0.txt \
        THIRD_PARTY_NOTICES.md
    do
        install -Dm644 "src/win32/installer/zenz_runtime/licenses/${zenz_license}" \
            "${licdir}/zenz-runtime/${zenz_license}"
    done

    # ドキュメント
    for documentation_file in src/data/installer/*.html
    do
        install -Dm644 "${documentation_file}" \
            "${pkgdir}/usr/share/doc/mozkey-ibg/$(basename -- "${documentation_file}")"
    done
}
