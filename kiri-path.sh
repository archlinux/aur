case ":${PATH}:" in
  *:/usr/lib/kiri/path:*) ;;
  *) PATH="${PATH:+$PATH:}/usr/lib/kiri/path"; export PATH ;;
esac
