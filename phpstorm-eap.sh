# use Arch JRE/JDK for phpstorm-eap
if [ -d /usr/lib/jvm/default-runtime ]; then
        export WEBIDE_JDK=/usr/lib/jvm/default-runtime
fi
