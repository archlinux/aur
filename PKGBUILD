# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>
# Contributor: Felix Springer <felixspringer149@gmail.com>
# Contributor: Moritz Wachsmuth-Melm <moritz [dot] wachsmuth [at] bioquant [dot] uni-heidelberg [dot] de>

pkgname=imod-bin
pkgver=5.2.1
pkgrel=1
pkgdesc="Image-Processing, Modeling and Display Programs for Tomography and 3D Reconstruction"
arch=('x86_64')
url="https://bio3d.colorado.edu/imod/"
license=('GPL')
provides=('3dmod' '3dmodv' 'addtostack' 'adocxmlconv' 'alignframes' 'alignlog' 'alterheader' 'alttomosetup' 'archiveorig' 'assemblevol' 'autofidseed' 'autopatchfit' 'avganova' 'avgstack' 'avgstatplot' 'b3dcatfiles' 'b3dcopy' 'b3dhostname' 'b3dremove' 'b3drename' 'b3dtomosetexts' 'b3dtouch' 'b3dwinps' 'batchruntomo' 'beadtrack' 'binvol' 'blendmont' 'boxavg' 'boxstartend' 'calc' 'ccderaser' 'checkmtmod' 'checkxforms' 'chunksetup' 'clip' 'clipmodel' 'clonemodel' 'clonevolume' 'collectmmm' 'colornewst' 'combinefft' 'contourmod' 'convertmod' 'copyheader' 'copytomocoms' 'corrsearch3d' 'cryoposition' 'ctf3dsetup' 'ctfphaseflip' 'ctfplotter' 'densmatch' 'densnorm' 'dm2mrc' 'dm3props' 'dualvolmatch' 'echo2' 'edgeeraser' 'edgemtf' 'edgepatches' 'edmont' 'edpiecepoint' 'endmodel' 'enhance' 'eraser' 'etomo' 'etomo.jar' 'etomoPluginDemo' 'excise' 'excludeviews' 'expandargs' 'extposition' 'extractmagrad' 'extractpieces' 'extracttilts' 'extstack' 'fenestra' 'fftrans' 'fiberpitch' 'filltomo' 'filterplot' 'findbeads3d' 'findcontrast' 'finddistort' 'findgradient' 'findhotpixels' 'findsection' 'findsirtdiffs' 'findwarp' 'finishjoin' 'fitpatches' 'fixboundaries' 'fixmont' 'flattenwarp' 'framewatcher' 'genhstplt' 'goodframe' 'gpuallocator' 'gpumonitor' 'gputilttest' 'header' 'howflared' 'idfprocess' 'imavgstat' 'imod' 'imod2meta' 'imod2obj' 'imod2patch' 'imod2rib' 'imod2vrml' 'imod2vrml2' 'imodauto' 'imodchopconts' 'imodcpuload' 'imodcurvature' 'imod-dist' 'imodexplode' 'imodextract' 'imodfillin' 'imodfindbeads' 'imodhelp' 'imodholefinder' 'imodinfo' 'imodjoin' 'imodkillgroup' 'imodmesh' 'imodmop' 'imodpsview' 'imodqtassist' 'imodsendevent' 'imodsetvalues' 'imodsortsurf' 'imodtrans' 'imoduntar' 'imodv' 'joinmodel' 'joinwarp2model' 'justblend' 'makecomfile' 'makegradtable' 'makejoincom' 'makepyramid' 'manageshrmem' 'MarkersCorrespond' 'matchorwarp' 'matchrotpairs' 'matchshifts' 'matchvol' 'maxjoinsize' 'midas' 'model2point' 'montagesize' 'mrc2tif' 'mrcbyte' 'mrctaper' 'mrcx' 'mtdetect' 'mtffilter' 'mtk' 'mtlengths' 'mtmodel' 'mtoverlap' 'mtpairing' 'mtrotlong' 'mtsmooth' 'mtteach' 'multifiltsetup' 'nad_eed_3d' 'nda' 'newstack' 'numericdiff' 'onegenplot' 'onepatchcorr' 'patch2imod' 'patchcorr3d' 'patchcrawl3d' 'pickbestseed' 'point2model' 'preNAD' 'preNID' 'processchunks' 'prochunks.csh' 'queuechunk' 'RAPTOR' 'raw2mrc' 'rawtiltcoords' 'realbin' 'realscalemod' 'rec2imod' 'recombine' 'reducecont' 'reducefiltvol' 'reducemont' 'reducemtmod' 'refinematch' 'remapmodel' 'repackseed' 'resamplemod' 'restrictalign' 'rotatevol' 'rotmont' 'runimodqtapp' 'runraptor' 'sampletilt' 'scalemodel' 'sda' 'selfalign' 'serieswatcher' 'setlibpath' 'settmpdir' 'setupcombine' 'setupcoms' 'setuplong' 'setupstitch' 'sirtsetup' 'slashfindspheres' 'slashmasksort' 'slicesforsample' 'slurmCleanup.sh' 'slurmInit.sh' 'smoothsurf' 'solvematch' 'sortbeadsurfs' 'sorttiltframes' 'splitbatch' 'splitblend' 'splitcombine' 'splitcorrection' 'splitmrc' 'splittilt' 'squeezevol' 'stackframemdocs' 'startprocess' 'stitchalign' 'subimage' 'subimanova' 'subimstat' 'subm' 'submfg' 'subtomosetup' 'subtractcurves' 'sumdensity' 'swaptomostacks' 'taperoutvol' 'tapervoledge' 'testctffind' 'tif2mrc' 'tilt' 'tiltalign' 'tiltxcorr' 'tomocleanup' 'tomodataplots' 'tomopieces' 'tomopitch' 'tomosnapshot' 'tomostitch' 'transferfid' 'trimvol' 'vmstocsh' 'vmstopy' 'warpvol' 'wmod2imod' 'xcorrstack' 'xf2rotmagstr' 'xfalign' 'xfinterstack' 'xfinverse' 'xfjointomo' 'xfmodel' 'xfproduct' 'xfsimplex' 'xftoxg' 'xyzproj')
depends=('libjpeg6-turbo' 'python')
optdepends=('cuda>=12: for library bindings'
            'java-runtime: for Etomo'
            'tcsh: for only a few very specializied scripts')
source=("https://bio3d.colorado.edu/ftp/latestIMOD/RHEL8-64_CUDA12.0/imod_${pkgver}_RHEL8-64_CUDA12.0.sh"
        'imod.sh')
sha256sums=('9cc734cccd90422f7ff1c44697c90c3d3936daf0f9fe3c2754112902d58db028'
            '0207fa692172c631e15c795598f855438401784a426a7dd2b79a2caac24b050b')

build() {
    sh imod_${pkgver}_RHEL8-64_CUDA12.0.sh -extract

    cd "IMODtempDir/"
    tar xvzf "imod_${pkgver}_RHEL8-64_CUDA12.0.tar.gz"
}

package() {
    mkdir -p "$pkgdir/opt"
    cp -r "$srcdir/IMODtempDir/imod_$pkgver/" "$pkgdir/opt/"
    mv "$pkgdir/opt/imod_$pkgver" "$pkgdir/opt/imod"

    mkdir -p "$pkgdir/etc/profile.d/"
    cp "imod.sh" "$pkgdir/etc/profile.d/"
}
