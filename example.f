c     ------------------------------------------------------------------
c     An empty dummy element routine that can be compiled against the
c     Feappv archive.
c     ------------------------------------------------------------------
      subroutine elmt01(d, ul, xl, IX, tl, K, R, ndf, ndm, nst, isw)
        implicit none
        include 'cdata.h'
        include 'iofile.h'
        include 'pmod2d.h'
        double precision d(*), ul(ndf, nen, 6), xl(ndm, nen), tl(nen),
     &      K(nst, nst), R(nst)
        integer ndf, ndm, nst, isw, IX(nen)
        save

        ! Examp

      return
      end
c     ------------------------------------------------------------------
