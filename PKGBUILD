# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-01-30.

_pkgname=naturalearth-data-raster
pkgname="${_pkgname}-latest"
epoch=0
_pkgver=latest
pkgver=3.3.0
pkgrel=1
pkgdesc="A public domain map dataset, tightly integrated vector and raster data, to make a maps.
This package provides the raster data in 1:10mio and 1:50mio scale, converted to jpeg compressed tiff.
WARNING: Build needs ca. 2.5 GiB space, install ca. 350 MiB big."
arch=(any)
url="http://www.naturalearthdata.com/"
license=('custom:public domain')
options=('emptydirs')

groups=(
        "naturalearth"
        "naturalearth-data"
       )

depends=(
        )

makedepends=(
  "gdal" # To compress the TIFF-files.
  "unzip"
)

optdepends=(
            "naturalearth-data-vector: For vector data of cultural and physical features."
           )

provides=(
  "${_pkgname}=${pkgver}"
  "naturalearth-data-raster-10m=${pkgver}"
  "naturalearth-data-raster-50m=${pkgver}"
  "naturalearth-data=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "naturalearth-data-raster-10m"
  "naturalearth-data-raster-50m"
)

_source_data=(
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/HYP_HR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/HYP_HR_SR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/HYP_HR_SR_W.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/HYP_HR_SR_W_DR.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/HYP_HR_SR_OB_DR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE1_HR_LC.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE1_HR_LC_SR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE1_HR_LC_SR_W.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE1_HR_LC_SR_W_DR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE2_HR_LC.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE2_HR_LC_SR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE2_HR_LC_SR_W.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE2_HR_LC_SR_W_DR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/OB_LR.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/SR_HR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/GRAY_HR_SR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/GRAY_HR_SR_W.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/GRAY_HR_SR_OB.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/GRAY_HR_SR_OB_DR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/US_MSR_10M.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/HYP_50M_SR.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/HYP_50M_SR_W.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/NE1_50M_SR.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/NE1_50M_SR_W.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/NE2_50M_SR.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/NE2_50M_SR_W.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/OB_50M.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/BATH_50M.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/SR_50M.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/GRAY_50M_SR.zip"
  #"http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/GRAY_50M_SR_W.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/GRAY_50M_SR_OB.zip"
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/MSR_50M.zip"
)

_source_thumbnails=(
  HYP_HR.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_hypso_no_sr.gif
  HYP_HR_SR.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_hypso.gif
  HYP_HR_SR_W.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_hypso_water.gif
  HYP_HR_SR_W_DR.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_hypso_water_river_lake1.gif
  HYP_HR_SR_OB_DR.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_hypso_bath_river_lake1.gif
  NE1_HR_LC.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne1_lc.jpg
  NE1_HR_LC_SR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne1_lc_sr.jpg
  NE1_HR_LC_SR_W.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne1_lc_sr_h20.jpg
  NE1_HR_LC_SR_W_DR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne1_lc_sr_h20_dr.jpg
  NE2_HR_LC.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne2_lc.jpg
  NE2_HR_LC_SR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne2_lc_sr.jpg
  NE2_HR_LC_SR_W.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne2_lc_sr_h20.jpg
  NE2_HR_LC_SR_W_DR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne2_lc_sr_h20_dr.jpg
  OB_LR.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_ocean_bottom.gif
  SR_HR.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_shaded_relief.gif
  GRAY_HR_SR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2012/11/ge_sr_hyp.jpeg
  GRAY_HR_SR_W.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2012/11/ge_sr_hyp_fw.jpeg
  GRAY_HR_SR_OB.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2012/11/ge_sr_hyp_ob.jpeg
  GRAY_HR_SR_OB_DR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2012/11/ge__sr_hyp_ob_dr.jpeg
  US_MSR_10M.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2015/12/US_Relief_Thumb.gif
  HYP_50M_SR.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_hypso.gif
  HYP_50M_SR_W.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_hypso_water.gif
  NE1_50M_SR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne1_lc_sr1.jpg
  NE1_50M_SR_W.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne1_lc_sr_h202.jpg
  NE2_50M_SR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne2_lc_sr1.jpg
  NE2_50M_SR_W.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2009/09/ne2_lc_sr_h201.jpg
  OB_50M.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_ocean_bottom.gif
  BATH_50M.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_bathymetry.gif
  SR_50M.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2009/08/ner_10m_shaded_relief.gif
  GRAY_50M_SR.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2012/11/ge_sr_hyp.jpeg
  GRAY_50M_SR_W.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2012/11/ge_sr_hyp_fw.jpeg
  GRAY_50M_SR_OB.thumb.jpg::http://www.naturalearthdata.com/wp-content/uploads/2012/11/ge_sr_hyp_ob.jpeg
  MSR_50M.thumb.gif::http://www.naturalearthdata.com/wp-content/uploads/2015/01/ner_50m_gen_shaded_relief.gif
)

_source_meta=(
  'datasets_description.txt'
  "LICENSE.html::http://www.naturalearthdata.com/about/terms-of-use/"
  'public_domain.txt'
)

source=(
  "${_source_data[@]}"
  "${_source_thumbnails[@]}"
  "${_source_meta[@]}"
)

sha256sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  '01983e7a533a2bfc61ee704ec70ead8c78b276b35c8e6755ad8e671892c6eff1287320926bc36ea05fc8f203beee63ed8b2730878ea404c4faec32dbaf2758ac'
  'SKIP'
  '46be88d3c7eb023c4c719a8cc8ad98a4915886c283d78cd4134dea828a1c9f4b7199ecfd69bb7374e6e3653b06f5e18a56a17b060ad228ded472ef74b918b871'
)

pkgver() {
  ls -1 "${srcdir}"/{*/,}*.VERSION.txt | while read _i; do cat "${_i}"; echo; done | sort --version-sort --reverse | uniq | head -n 1
}

package() {
  _instdirbase='/opt/naturalearth-data'
  _instdir="${pkgdir}/${_instdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"

  install -v -d -m755 "${_instdir}"
  install -v -d -m755 "${_instdir}/raster"
  install -v -d -m755 "${_instdir}/raster/10m"
  install -v -d -m755 "${_instdir}/raster/50m"

  ### Save some space during build: makepkg will have auto-extracted the sources, but for our "tidyness" we need to re-extract in a controlled way. So we first remove the big auto-extracted TIFF-files.
  rm -f "${srcdir}"/{*/,}*.tif

  ### Use a scratch directory to sort the stuff.
  _scratch="${_instdir}/raster/scratch"
  mkdir "${_scratch}"
  cd "${_scratch}"

  ### Extract everything (most of the data will provide it's own subdirectory).
  ls -1 "${srcdir}"/*.zip | while read _zipfile; do
    unzip "${_zipfile}"
  done

  ### Delete "Trash".
  rm -rf "__MACOSX" */"__MACOSX"

  ### NE1_HR_LC_SR_W_DR does not provide it's own subdirectory, so create it manually and move the stuff there.
  install -v -d -m755 "${_scratch}/NE1_HR_LC_SR_W_DR"
  mv "${_scratch}"/NE1_HR_LC_SR_W_DR.* "${_scratch}/NE1_HR_LC_SR_W_DR/"

  ### Convert to JPEG-compressed tiff to save space.
  _tmptif="${_scratch}/tmp.jpeg.tif"
  ls -1 */*.tif | while read _tif; do
    echo -n "jpeg-compressing $(basename "${_tif}") ... "
    # Some can not have 'PHOTOMETRIC=YCBCR'.
    gdal_translate -co 'COMPRESS=JPEG' -co 'JPEG_QUALITY=92' -co 'PHOTOMETRIC=YCBCR' "${_tif}" "${_tmptif}" || gdal_translate -co 'COMPRESS=JPEG' -co 'JPEG_QUALITY=92' "${_tif}" "${_tmptif}"
    mv -f "${_tmptif}" "${_tif}"
  done

  ### Set permissions.
  chmod 755 *
  chmod 644 */*

  ### Add thumbnails.
  install -m644 "${srcdir}"/*.thumb.{gif,jpg} "${_scratch}"

  ### Move into places.
  mv "${_scratch}"/*_50M* "${_instdir}/raster/50m/"
  mv "${_scratch}"/* "${_instdir}/raster/10m/"

  ### Remove the scratch directory.
  rmdir "${_scratch}"

  ### Install information/ documentation.
  install -v -d -m755 "${_docdir}"
  echo "${url}" > "${_docdir}/info.url"
  chmod 644 "${_docdir}/info.url"
  install -v -m644 "${srcdir}"/datasets_description.txt "${_docdir}/datasets_description.txt"

  ### Install licensing information.
  install -v -D -m644 "${srcdir}/public_domain.txt" "${pkgdir}/usr/share/licenses/${pkgname}/public_domain.txt"
  install -v -D -m644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
