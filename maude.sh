# /etc/profile.d/maude.sh

if [ -d "/usr/share/maude" ]; then
  case "${MAUDE_LIB}" in
    /usr/share/maude)
      ;;
    /usr/share/maude:*)
      ;;
    *:/usr/share/maude)
      ;;
    *:/usr/share/maude:*)
      ;;
    *)
      MAUDE_LIB="${MAUDE_LIB:-}${MAUDE_LIB:+:}/usr/share/maude"
      export MAUDE_LIB
      ;;
  esac
fi

# /etc/profile.d/maude.sh ends here.
