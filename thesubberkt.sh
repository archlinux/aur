for name in /usr/share/java/thesubberkt/*.jar; do
  CP=$CP:$name
done

java -cp $CP org.vaurelios.thesubberkt.TheSubberKt "$@"
