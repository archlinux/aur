#!/bin/bash
#
# Simple bash script to auto-update this package, but only if nothing except the hashs, "pkgver=",
# "pkgrel=" in 'PKGBUILD' and the version number commented in the third line of 'config' has been
# changed beetwen the upstream version matching the current local version and the upstream current
# version. Very mutch a work in progress, DO NOT TRUST.
#

validated_for="6.17.6.arch1-1"
forceupd="n"

# Getting current versions
  curl -s -o .bump-pn https://gitlab.archlinux.org/api/v4/projects/42594/repository/files/PKGBUILD/raw/\?ref\=main
  live_ver="$(grep pkgver= .bump-pn | cut -d'=' -f2)"
  live_rel="$(grep pkgrel= .bump-pn | cut -d'=' -f2)"
  local_ver="$(grep pkgver= PKGBUILD | cut -d'=' -f2)"
  local_rel="$(grep pkgrel= PKGBUILD | cut -d'=' -f2)"

# Check if an update is available
  if [ "$local_ver-$local_rel" != "$live_ver-$live_rel" ]; then
    echo "Current eq version:  $local_ver-$local_rel"
    echo -e "Upstream version:    $live_ver-$live_rel\n"
    upd="y"

    # Download and prepare necessary files
      curl -s -o .bump-po https://gitlab.archlinux.org/api/v4/projects/42594/repository/files/PKGBUILD/raw/\?ref\=$local_ver-$local_rel
      curl -s -o .bump-cn https://gitlab.archlinux.org/api/v4/projects/42594/repository/files/config/raw/\?ref\=$live_ver-$live_rel
      curl -s -o .bump-co https://gitlab.archlinux.org/api/v4/projects/42594/repository/files/config/raw/\?ref\=$local_ver-$local_rel

    # Neutralize version numbers in linux PKGBUILD and config
      sed "s|pkgver=${local_ver}|pkgver=|" .bump-po | sed "s|pkgrel=${local_rel}|pkgrel=|" > .bump-po1
      sed "s|pkgver=${live_ver}|pkgver=|" .bump-pn | sed "s|pkgrel=${live_rel}|pkgrel=|" > .bump-pn1
      sed "s|# Linux/x86 ${local_ver} Kernel Configuration|# Linux/x86 Kernel Configuration|" .bump-co > .bump-con
      sed "s|# Linux/x86 ${live_ver} Kernel Configuration|# Linux/x86 Kernel Configuration|" .bump-cn > .bump-cnn

    # Neutralize hashs fields in linux PKGBUILDs (TODO: something not hardcoded)
      for file in '.bump-po' '.bump-pn'; do
        head -n47 $file"1" > $file"n"
        tail -n+58 $file"1" >> $file"n"
      done

    # Warn if not valideted
      if [ "$validated_for" != "$local_ver-$local_rel" ]; then
        upd="n"
        echo -e "\033[1;33mW:\033[0m script validated for $validated_for not $local_ver-$local_rel (update function disabled)."
      fi

    # Check and print results for 'PKGBUILD'
      if [ "$(diff -q .bump-pnn .bump-pon)" == "" ]; then
        echo -e "\033[0;32mv\033[0m upstream 'PKGBUILD' seems unchanged."
      else
        upd="n"
        echo -e "\033[0;31mx\033[0m upstream 'PKGBUILD' has been changed."
      fi

    # Check and print results for 'config'
      if [ "$(diff -q .bump-cnn .bump-con)" == "" ]; then
        echo -e "\033[0;32mv\033[0m upstream 'config' seems unchanged."
      else
        upd="n"
        echo -e "\033[0;31mx\033[0m upstream 'config' has been changed."
      fi

    # Continue only if all the conditions are met
      if [ "$upd" == "y" ] || [ "$forceupd" == "y" ]; then

        # Writing new PKGBUILD proposal (TODO: something not hardcoded)
          head -n51 PKGBUILD > .bump-up1
          tail -n+48 .bump-pn | head -n10 >> .bump-up1
          tail -n+62 PKGBUILD >> .bump-up1
          sed "s|pkgver=${local_ver}|pkgver=${live_ver}|" .bump-up1 | sed "s|pkgrel=${local_rel}|pkgrel=${local_rel}|" | \
          sed "s|# https://gitlab.archlinux.org/packaging/packages/linux/blob/${local_ver}-${local_rel}/PKGBUILD|# https://gitlab.archlinux.org/packaging/packages/linux/blob/${live_ver}-${local_rel}/PKGBUILD|" \
          > .bump-np

        # Recap of the proposed changes
          echo -e "\nProposed changes to PKGBUILD for linux-stub:"
          diff -u1 --color --label "Current" --label "Updated" PKGBUILD .bump-np

        # Ask if wanting to commit the changes
          echo ""; read -p "Apply changes ? [y/N]:" val
          if [ "$val" == "y" ] || [ "$val" == "Y" ]; then

            # Write the PKGBUID proposal on top of the current PKGBUILD
              echo "Updating PKGBUILD"
              mv .bump-np PKGBUILD

            # Update .SRCINFO
              echo "Updating .SRCINFO"
              makepkg --printsrcinfo > .SRCINFO

            # Update the validated_for variable of this script
              sed "s|validated_for=\"${validated_for}\"|validated_for=\"${live_ver}-${live_rel}\"|" bump.sh > .bump-shv
              cp .bump-shv bump.sh

            # Update local repo
              if [ "$forceupd" == "y" ]; then
                read -p "git commit/tag message:" msg
                git commit -asm "$live_ver-$live_rel ($msg)"
                git tag -s "$live_ver-$live_rel" -m "$msg"

                sed "s|forceupd=\"y\"|forceupd=\"n\"|" bump.sh > .bump-shf
                cp .bump-shf bump.sh
              else
                git commit -asm "$live_ver-$live_rel (no changes, auto-updated)"
                git tag -s "$live_ver-$live_rel" -m "no changes, auto-updated"
              fi

            # Update remote
              echo "Check everything before pushing."
              echo "TODO: git push"
          fi
      fi
  else
    echo "Allready same version ($local_ver-$local_rel) as the main branch."
  fi

# Remove temporary files
  rm .bump-*