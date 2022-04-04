# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: redtide <redtid3@gmail.com>

_name=cardinal
pkgbase=cardinal-git
pkgname=(cardinal-git cardinal-data-git cardinal-jack-git cardinal-lv2-git cardinal-vst-git cardinal-vst3-git)
pkgver=22.04.r0.g6795d8a
pkgrel=1
pkgdesc="Virtual modular synthesizer plugin"
arch=(x86_64)
url="https://github.com/DISTRHO/Cardinal"
license=(GPL3)
groups=(lv2-plugins pro-audio vst-plugins vst3-plugins)
makedepends=(dbus file gendesk git libarchive liblo libsndfile libsamplerate mold python)
depends=(gcc-libs glibc jansson libglvnd libx11 libxext libxrandr speexdsp)
optdepends=(
  'carla: for carla module and ildaeil plugin host'
  'jack: for JACK standalone'
  'lv2-host: for hosting the LV2 plugin'
  'mpv: for experimental video support'
  'vst-host: for hosting the VST2 plugin'
  'vst3-host: for hosting the VST3 plugin'
)
source=(
  git+https://github.com/distrho/cardinal.git
  git+https://github.com/vcvrack/rack.git
  git+https://github.com/distrho/dpf.git
  git+https://github.com/meganz/mingw-std-threads.git
  git+https://github.com/dltcollab/sse2neon.git
  git+https://github.com/vcvrack/befaco.git
  git+https://github.com/cardinalmodules/fundamental.git
  git+https://github.com/cardinalmodules/audibleinstruments.git
  animatedcircuits::git+https://github.com/animatedcircuits/rackmodules.git
  git+https://github.com/mhampton/zetacarinaemodules.git
  git+https://github.com/dbgrande/grandemodular.git
  git+https://github.com/bogaudio/bogaudiomodules.git
  git+https://github.com/cardinalmodules/bidoo.git
  git+https://github.com/vcvrack/eseries.git
  git+https://github.com/jeremywen/jw-modules.git
  git+https://github.com/cardinalmodules/rackwindows.git
  git+https://github.com/marcboule/impromptumodular.git
  git+https://github.com/jhoar/amalgamatedharmonics.git
  git+https://github.com/cardinalmodules/cf.git
  git+https://github.com/marcboule/mindmeldmodular.git
  git+https://github.com/valleyaudio/valleyrackfree.git
  git+https://github.com/svmodular/drumkit.git
  git+https://github.com/falktx/carla.git
  git+https://github.com/cardinalmodules/mschack.git
  git+https://github.com/zezic/zzc.git
  git+https://github.com/wiqid/repelzen.git
  git+https://github.com/cardinalmodules/ariamodules.git
  git+https://github.com/baconpaul/baconplugs.git
  git+https://github.com/rcameron93/fehlerfabrik.git
  git+https://gitlab.com/sonusdept/sonusmodular.git
  git+https://github.com/cardinalmodules/mog-vcv.git
  git+https://github.com/jatinchowdhury18/chowdsp-vcv.git
  git+https://github.com/gluethegiant/gtg-rack.git
  git+https://github.com/mhetrick/hetrickcv.git
  git+https://github.com/vegadeftwing/lyraemodules.git
  git+https://github.com/mgunyho/little-utils.git
  git+https://github.com/steverussell33/prism.git
  git+https://github.com/eaterofsheep/extratone.git
  git+https://github.com/steverussell33/lifeformmodular.git
  git+https://github.com/netboy3/21khz-rack-plugins.git
  git+https://github.com/distrho/pawpaw.git
  git+https://github.com/lomasmodules/lomasmodules.git
  git+https://github.com/expertsleepersltd/vcvrack-encoders.git
  git+https://github.com/cardinalmodules/ihtsyn.git
  git+https://github.com/jerrysievert/quickjs.git
  git+https://github.com/nikolaivchr/autinn.git
  git+https://github.com/mockbatheborg/mockbamodular.git
  git+https://github.com/8mode/8mode-vcv_modules.git
  git+https://github.com/kauewerner/axioma.git
  git+https://github.com/jensschulze/goodsheperd.git
  git+https://gitlab.com/hampton-harmonics/hampton-harmonics-modules.git
  git+https://github.com/martin-lueders/ml_modules.git
  git+https://github.com/rarebreeds/orbits.git
  git+https://github.com/aptrn/stocaudio-modules.git
  git+https://github.com/catronomix/catro-modulo.git
  git+https://github.com/grough/lilac-loop-vcv.git
  git+https://github.com/janne808/kocmoc-rack-modules.git
  git+https://github.com/patheros/pathsetmodules.git
  git+https://github.com/algoritmarte/algoritmartevcvplugin.git
  git+https://github.com/aaronstatic/aaronstatic_modules.git
  git+https://github.com/netboy3/msm-vcvrack-plugin.git
  git+https://github.com/mhetrick/nonlinearcircuits.git
  git+https://github.com/clone45/voxglitch.git
  git+https://github.com/cardinalmodules/arableinstruments.git

  git+https://github.com/distrho/pugl.git

  git+https://github.com/falktx/carla-plugins

  git+https://github.com/vcvrack/nanovg.git
  git+https://github.com/memononen/nanosvg.git
  git+https://github.com/andrewbelt/osdialog.git
  git+https://github.com/vcvrack/oui-blendish.git
  git+https://github.com/vcvrack/rtaudio.git
  git+https://github.com/vcvrack/glfw.git
  git+https://bitbucket.org/j_norberg/fuzzysearchdatabase.git
  git+https://github.com/gulrak/filesystem.git
  git+https://bitbucket.org/jpommier/pffft.git

  git+https://github.com/cardinalmodules/eurorack.git

  git+https://github.com/pichenettes/avril.git
  git+https://github.com/pichenettes/avrilx.git
  git+https://github.com/pichenettes/stmlib.git
  git+https://github.com/pichenettes/stm-audio-bootloader.git
  git+https://github.com/pichenettes/avr-audio-bootloader.git

  git+https://github.com/craigsapp/midifile.git

  git+https://github.com/chowdhury-dsp/chowdsp_utils.git

  git+https://github.com/jerrysievert/synthdevkit.git

  git+https://github.com/lanceputnam/gamma.git
)
sha512sums=('SKIP'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  (
    cd $_name
    git submodule init
    git config submodule.src.Rack.url ../rack
    git config submodule.dpf.url ../dpf
    git config submodule.include.mingw-std-threads.url ../mingw-std-threads
    git config submodule.include.sse2neon.url ../sse2neon
    git config submodule.plugins.Befaco.url ../befaco
    git config submodule.plugins.Fundamental.url ../fundamental
    git config submodule.plugins.AudibleInstruments.url ../audibleinstruments
    git config submodule.plugins.AnimatedCircuits.url ../animatedcircuits
    git config submodule.plugins.ZetaCarinaeModules.url ../zetacarinaemodules
    git config submodule.plugins.GrandeModular.url ../grandemodular
    git config submodule.plugins.BogaudioModules.url ../bogaudiomodules
    git config submodule.plugins.Bidoo.url ../bidoo
    git config submodule.plugins.ESeries.url ../eseries
    git config submodule.plugins.JW-Modules.url ../jw-modules
    git config submodule.plugins.rackwindows.url ../rackwindows
    git config submodule.plugins.ImpromptuModular.url ../impromptumodular
    git config submodule.plugins.AmalgamatedHarmonics.url ../amalgamatedharmonics
    git config submodule.plugins.cf.url ../cf
    git config submodule.plugins.MindMeldModular.url ../mindmeldmodular
    git config submodule.plugins.ValleyAudio.url ../valleyrackfree
    git config submodule.plugins.DrumKit.url ../drumkit
    git config submodule.carla.url ../carla
    git config submodule.plugins.mscHack.url ../mschack
    git config submodule.plugins.ZZC.url ../zzc
    git config submodule.plugins.repelzen.url ../repelzen
    git config submodule.plugins.AriaModules.url ../ariamodules
    git config submodule.plugins.BaconPlugs.url ../baconplugs
    git config submodule.plugins.FehlerFabrik.url ../fehlerfabrik
    git config submodule.plugins.sonusmodular.url ../sonusmodular
    git config submodule.plugins.Mog.url ../mog-vcv
    git config submodule.plugins.ChowDSP.url ../chowdsp-vcv
    git config submodule.plugins.GlueTheGiant.url ../gtg-rack
    git config submodule.plugins.HetrickCV.url ../hetrickcv
    git config submodule.plugins.LyraeModules.url ../lyraemodules
    git config submodule.plugins.LittleUtils.url ../little-utils
    git config submodule.plugins.Prism.url ../prism
    git config submodule.plugins.Extratone.url ../extratone
    git config submodule.plugins.LifeFormModular.url ../lifeformmodular
    git config submodule.plugins.21kHz.url ../21khz-rack-plugins
    git config submodule.deps.PawPaw.url ../pawpaw
    git config submodule.plugins.LomasModules.url ../lomasmodules
    git config submodule.plugins.ExpertSleepers-Encoders.url ../vcvrack-encoders
    git config submodule.plugins.ihtsyn.url ../ihtsyn
    git config submodule.plugins.QuickJS.url ../quickjs
    git config submodule.plugins.Autinn.url ../autinn
    git config submodule.plugins.MockbaModular.url ../mockbamodular
    git config submodule.plugins.8Mode.url ../8mode-vcv_modules
    git config submodule.plugins.Axioma.url ../axioma
    git config submodule.plugins.GoodShepherd.url ../goodshepherd
    git config submodule.plugins.HamptonHarmonics.url ../hampton-harmonics-modules
    git config submodule.plugins.ML_modules.url ../ml_modules
    git config submodule.plugins.Orbits.url ../orbits
    git config submodule.plugins.stocaudio.url ../stocaudio-modules
    git config submodule.plugins.CatroModulo.url ../catro-modulo
    git config submodule.plugins.LilacLoop.url ../lilac-loop-vcv
    git config submodule.plugins.kocmoc.url ../kocmoc-rack-modules
    git config submodule.plugins.PathSet.url ../pathsetmodules
    git config submodule.plugins.Algoritmarte.url ../algoritmartevcvplugin
    git config submodule.plugins.Aaronstatic.url ../aaronstatic_modules
    git config submodule.plugins.MSM.url ../msm-vcvrack-plugin
    git config submodule.plugins.nonlinearcircuits.url ../nonlinearcircuits
    git config submodule.plugins.voxglitch.url ../voxglitch
    git config submodule.plugins.ArableInstruments.url ../arableinstruments
    git submodule update
    (
      cd dpf
      git submodule init
      git config submodule.dgl.src.pugl-upstream.url "$srcdir/pugl"
      git submodule update
    )
    (
      cd carla
      git submodule init
      git config submodule.source.native-plugins.external.url "$srcdir/carla-plugins"
      git submodule update
    )
    (
      cd src/Rack
      git submodule init
      git config submodule.dep.nanovg.url "$srcdir/nanovg"
      git config submodule.dep.nanosvg.url "$srcdir/nanosvg"
      git config submodule.dep.osdialog.url "$srcdir/osdialog"
      git config submodule.dep.oui-blendish.url "$srcdir/oui-blendish"
      git config submodule.dep.rtaudio.url "$srcdir/rtaudio"
      git config submodule.dep.glfw.url "$srcdir/glfw"
      git config submodule.dep.fuzzysearchdatabase.url "$srcdir/fuzzysearchdatabase"
      git config submodule.dep.filesystem.url "$srcdir/filesystem"
      git config submodule.dep.pffft.url "$srcdir/pffft"
      git submodule update
    )
    (
      cd plugins/AudibleInstruments
      git submodule init
      git config submodule.eurorack.url "$srcdir/eurorack"
      git submodule update
    )
    (
      cd plugins/AudibleInstruments/eurorack
      git submodule init
      git config submodule.avrlib.url "$srcdir/avril"
      git config submodule.avrlibx.url "$srcdir/avrilx"
      git config submodule.stmlib.url "$srcdir/stmlib"
      git config submodule.stm_audio_bootloader.url "$srcdir/stm-audio-bootloader"
      git config submodule.avr_audio_bootloader.url "$srcdir/avr-audio-bootloader"
      git submodule update
    )
    (
      cd plugins/BaconPlugs
      git submodule init
      git config submodule.libs.midifile.url "$srcdir/midifile"
      git submodule update
    )
    (
      cd plugins/ChowDSP
      git submodule init
      git config submodule.lib.chowdsp_utils.url "$srcdir/chowdsp_utils"
      git submodule update
    )
    (
      cd plugins/DrumKit
      git submodule init
      git config submodule.deps.SynthDevKit.url "$srcdir/synthdevkit"
      git submodule update
    )
    (
      cd plugins/HetrickCV
      git submodule init
      git config submodule.Gamma.url "$srcdir/gamma"
      git submodule update
    )
    (
      cd plugins/ArableInstruments
      git submodule init
      git config submodule.eurorack.url "$srcdir/eurorack"
      git config submodule.parasites.avrlib.url "$srcdir/avril"
      git config submodule.parasites.avrlibx.url "$srcdir/avrilx"
      git config submodule.parasites.stmlib.url "$srcdir/stmlib"
      git config submodule.parasites.stm_audio_bootloader.url "$srcdir/stm-audio-bootloader"
      git config submodule.parasites.avr_audio_bootloader.url "$srcdir/avr-audio-bootloader"
      git submodule update
    )
    (
      cd plugins/ArableInstruments/eurorack
      git submodule init
      git config submodule.avrlib.url "$srcdir/avril"
      git config submodule.avrlibx.url "$srcdir/avrilx"
      git config submodule.stmlib.url "$srcdir/stmlib"
      git config submodule.stm_audio_bootloader.url "$srcdir/stm-audio-bootloader"
      git config submodule.avr_audio_bootloader.url "$srcdir/avr-audio-bootloader"
      git submodule update
    )
  )

  gendesk -n \
          --exec Cardinal \
          --name Cardinal \
          --pkgname studio.kx.distrho.Cardinal \
          --pkgdesc "$pkgdesc JACK standalone" \
          --icon $_name \
          --genericname "Virtual modular synthesizer"
}

build() {
  export CFLAGS+=" -B/usr/lib/mold"
  export CXXFLAGS+=" -B/usr/lib/mold"
  make PREFIX=/usr SYSDEPS=true WITH_LTO=true -C $_name
}

package_cardinal-git() {
  depends=(cardinal-jack=$pkgver cardinal-lv2=$pkgver cardinal-vst=$pkgver cardinal-vst3=$pkgver)
  conflicts=(cardinal)
  provides=(cardinal)

  make PREFIX=/usr SYSDEPS=true DESTDIR="$pkgdir" install -C $_name

  (
    cd "$pkgdir"
    _pick $pkgbase-data usr/share/$_name
    _pick $pkgbase-data usr/share/doc
    _pick $pkgbase-jack usr/bin/
    _pick $pkgbase-lv2 usr/lib/lv2/
    _pick $pkgbase-vst usr/lib/vst/
    _pick $pkgbase-vst3 usr/lib/vst3/
  )
}

package_cardinal-data-git() {
  pkgdesc+=" - data"
  conflicts=(cardinal-data)
  provides=(cardinal-data)

  mv -v $pkgbase-data/* "$pkgdir"
}

package_cardinal-jack-git() {
  pkgdesc+=" - JACK standalone"
  groups=(pro-audio)
  depends=(cardinal-data-git=$pkgver gcc-libs glibc jack jansson libglvnd libx11 libxext
  libxrandr speexdsp libdbus-1.so libarchive.so liblo.so libmagic.so
  libsndfile.so libsamplerate.so)
  optdepends=(
    'carla: for carla module and ildaeil plugin host'
    'mpv: for experimental video support'
  )
  conflicts=(cardinal-jack)
  provides=(cardinal-jack)

  mv -v $pkgbase-jack/* "$pkgdir"
  install -vDm 644 *.desktop -t "$pkgdir/usr/share/applications"
  install -vDm 644 $_name/plugins/Cardinal/orig/distrho.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
}

package_cardinal-lv2-git() {
  pkgdesc+=" - LV2 plugin"
  groups=(lv2-plugins pro-audio)
  depends=(cardinal-data-git=$pkgver gcc-libs glibc jansson libglvnd libx11 libxext
  libxrandr lv2-host speexdsp libdbus-1.so libarchive.so liblo.so libmagic.so
  libsndfile.so libsamplerate.so)
  optdepends=(
    'carla: for carla module and ildaeil plugin host'
    'mpv: for experimental video support'
  )
  conflicts=(cardinal-lv2)
  provides=(cardinal-lv2)

  mv -v $pkgbase-lv2/* "$pkgdir"
}

package_cardinal-vst-git() {
  pkgdesc+=" - VST2 plugin"
  groups=(pro-audio vst-plugins)
  depends=(cardinal-data-git=$pkgver gcc-libs glibc jansson libglvnd libx11 libxext
  libxrandr speexdsp vst-host libdbus-1.so libarchive.so liblo.so libmagic.so
  libsndfile.so libsamplerate.so)
  optdepends=(
    'carla: for carla module and ildaeil plugin host'
    'mpv: for experimental video support'
  )
  conflicts=(cardinal-vst)
  provides=(cardinal-vst)

  mv -v $pkgbase-vst/* "$pkgdir"
}

package_cardinal-vst3-git() {
  pkgdesc+=" - VST3 plugin"
  groups=(pro-audio vst3-plugins)
  depends=(cardinal-data-git=$pkgver gcc-libs glibc jansson libglvnd libx11 libxext
  libxrandr speexdsp vst3-host libdbus-1.so libarchive.so liblo.so libmagic.so
  libsndfile.so libsamplerate.so)
  optdepends=(
    'carla: for carla module and ildaeil plugin host'
    'mpv: for experimental video support'
  )
  conflicts=(cardinal-vst3)
  provides=(cardinal-vst3)

  mv -v $pkgbase-vst3/* "$pkgdir"
}
