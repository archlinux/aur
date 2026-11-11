# Kiri's docker CLI (kiri-bin). Appended last, so a docker from another
# package or ~/.local/bin keeps precedence.
case ":${PATH}:" in
  *:/usr/lib/kiri/path:*) ;;
  *) PATH="${PATH:+$PATH:}/usr/lib/kiri/path"; export PATH ;;
esac
