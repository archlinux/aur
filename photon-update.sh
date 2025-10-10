#!/bin/bash

set -e

if [ -z "$PHOTON_GRAPHHOPPER_EXTRACT" ]; then
    echo "PHOTON_GRAPHHOPPER_EXTRACT env variable not set."
    echo "Please enter one of the following graphhopper.com extract identifiers:"
    echo "Regions: world, africa, asia, australia-oceania, europe, north-america, south-america"
    echo "Countries: ad, ae, af, al, am, ao, ar, at, au, az, ba, bd, be, bf, bg, bh, bi, bj, bn, bo, br, bt, bw, by, bz, ca, cd, cf, cg, ch, ci, cl, cm, cn, co, cr, cu, cy, cz, de, dj, dk, do, dz, ec, ee, eg, er, es, et, fi, fr, ga, gb, ge, gh, gm, gn, gr, gt, hn, hr, ht, hu, id, ie, il, in, iq, ir, is, it, jo, jp, ke, kg, kh, kp, kr, kw, kz, la, lb, li, lk, lr, ls, lt, lu, lv, ly, ma, mc, md, me, mg, mk, ml, mm, mn, mr, mt, mu, mv, mw, mx, my, mz, na, ne, ng, ni, nl, no, np, nz, om, pa, pe, ph, pk, pl, ps, pt, py, qa, ro, rs, ru, rw, sa, sd, se, sg, si, sk, sl, sn, so, sr, ss, sv, sy, sz, td, tg, th, tj, tl, tm, tn, to, tr, tw, tz, ua, ug, us, uy, uz, ve, vn, xk, ye, za, zm, zw"
    echo
    read -rp "Extract: " PHOTON_GRAPHHOPPER_EXTRACT
fi

if ! [[ "$PHOTON_GRAPHHOPPER_EXTRACT" =~ ^([a-z]+[\-])?[a-z]{2,}$ ]]; then
    echo "No valid \$PHOTON_GRAPHHOPPER_EXTRACT set, exiting" 1>&2
    exit 2
fi

echo "Removing old $(pwd)/photon_data"
rm -Rf "./photon_data"

# Note: 'experimental' just referes to the OpenSearch extracts, which are recommended by photon

extract_url="https://download1.graphhopper.com/public"
if [ "${PHOTON_GRAPHHOPPER_EXTRACT}" = "world" ]; then
    # https://download1.graphhopper.com/public/experimental/photon-db-latest.tar.bz2
    extract_url="${extract_url}/experimental/photon-db-latest.tar.bz2"
elif [ "${#PHOTON_GRAPHHOPPER_EXTRACT}" -eq 2 ]; then
    # https://download1.graphhopper.com/public/experimental/extracts/by-country-code/de/photon-db-de-latest.tar.bz2
    extract_url="${extract_url}/experimental/extracts/by-country-code/${PHOTON_GRAPHHOPPER_EXTRACT}/photon-db-${PHOTON_GRAPHHOPPER_EXTRACT}-latest.tar.bz2"
else
    # https://download1.graphhopper.com/public/europe/photon-db-europe-0.7OS-latest.tar.bz2
    photon_minor_version='PHOTON_MINOR_VERSION_SED'
    extract_url="${extract_url}/${PHOTON_GRAPHHOPPER_EXTRACT}/photon-db-${PHOTON_GRAPHHOPPER_EXTRACT}-${photon_minor_version}OS-latest.tar.bz2"
fi

echo "Downloading '${extract_url}' to '$(pwd)/photon_data' …"

curl -s "$extract_url" | tar -xjf - -C ./
