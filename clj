#!/bin/sh
#
# A launcher script for Clojure programs. These environment variables can be
# used to configure the script:
#
#   CLOJURE_HOME
#       The root directory where Clojure is installed.
#   CLOJURE_JAVA
#       The name of the java executable used to run Clojure.
#   CLOJURE_JAVA_OPTS
#       Additional options to be passed to the java executable.
#   CLOJURE_CLASSPATH
#       A path to be added to Clojure's classpath.
#   CLOJURE_LIBRARY_PATH
#       A path to be searched for native code such as DLL's or JNI
#       libraries. This gets added to the Java options as
#       "-Djava.library.path=$CLOJURE_LIBRARY_PATH".
#   CLOJURE_LIB
#       This directory, and any jars inside it, will be automatically
#       added to Clojure's classpath.
#
#   CLOJURE_JLINE
#        This should be the path to Jline jar.
# TODO:
#   make CLOJURE_LIB a path instead of a single directory
#   allow for adding to CLOJURE_LIB from the command line

usage="\
usage: clojure [options] [file1 [file2] ...]

Options:
  --help, -h          show this message
  --java-cmd, -J      the Java executable to use
  --java-opts, -j     add options to be passed on to the JVM
  --classpath, -cp    add to Clojure's classpath
  --library-path, -L  add to the path to search for native libraries
  --verbose, -v       print initialization information
"
## read ~/.clojurerc for home configuration
[ -e ~/.clojurerc ] && . ~/.clojurerc

## read ./.clojurerc for project specific configuration
[ -e ./.clojurerc ] && . ./.clojurerc

if [ ! "$CLOJURE_HOME" ]; then
    # Find the real path to Clojure's home directory if $0 is a symlink
    #program="$0"
    #while [ -h "$program" ]; do
    #    ls=`ls -ld "$program"`
    #    link=`expr "$ls" : '.*-> \(.*\)$'`
    #    if expr "$link" : '.*/.*' >/dev/null; then
    #        program="$link"
    #    else
    #        program="`dirname $program`/$link"
    #    fi
    #done
    #script_dir=`dirname "$program"`
    #relative_clojure_home=`dirname "$script_dir"`
    #CLOJURE_HOME=`cd "$relative_clojure_home" && pwd`
    . /etc/profile.d/clojure.sh
fi

if [ ! "$CLOJURE_JAVA" ]; then
    CLOJURE_JAVA="java";
fi

if [ ! "$CLOJURE_JAVA_OPTS" ]; then
    CLOJURE_JAVA_OPTS="-Dpid=$$"; # set the pid for SLIME
fi

if [ ! "$CLOJURE_CLASSPATH" ]; then
    CLOJURE_CLASSPATH="."
fi

##  Add Clojure home jars.
for jar in "$CLOJURE_HOME"/*.jar; do
    CLOJURE_CLASSPATH="$CLOJURE_CLASSPATH:$jar"
done

if [ -d "$CLOJURE_LIB" ]; then
    CLOJURE_CLASSPATH="$CLOJURE_CLASSPATH:$CLOJURE_LIB"
    for jar in "$CLOJURE_LIB"/*.jar; do
        CLOJURE_CLASSPATH="$CLOJURE_CLASSPATH:$jar"
    done
fi

# this is now the same for both the repl and for scripts
main="clojure.main"
repl=0
verbose=0

while true; do
    case $1 in
        -h|--help)
            echo "$usage"; exit 1;;
        -J|--java-cmd)
            CLOJURE_JAVA="$2"; shift; shift;;
        -j|--java-opts)
            CLOJURE_JAVA_OPTS="$CLOJURE_JAVA_OPTS $2"; shift; shift;;
        -cp|--classpath)
            CLOJURE_CLASSPATH="$CLOJURE_CLASSPATH:$2"; shift; shift;;
        -L|--library-path)
            if [ "$CLOJURE_LIBRARY_PATH" ]; then
                CLOJURE_LIBRARY_PATH="$CLOJURE_LIBRARY_PATH:$2";
            else
                CLOJURE_LIBRARY_PATH="$2";
            fi
            shift; shift;;
	-v|--verbose)
	    verbose=1; shift;;
        *) break;;
    esac
done

[ $verbose -eq 1 ] && echo "$CLOJURE_CLASSPATH"

# If we didn't get any files to load on the commandline, we want to run the
# repl, with command line editing if available.
[ $# -eq 0 ] && repl=1

# If the classpath contains the JLine jar, use the JLine console runner
if expr "$CLOJURE_CLASSPATH" : ".*jline.*\.jar" >/dev/null; then
    [ $repl -eq 1 ] && jline="jline.ConsoleRunner"
fi

# Enable rlwrap if present
if [ $repl -eq 1 ] && [ -z $jline ]; then
    rlwrap=`type -p rlwrap`
fi

## Add CLOJURE_LIBRARY_PATH to the Java options if necessary
if [ -n "$CLOJURE_LIBRARY_PATH" ]; then
    CLOJURE_JAVA_OPTS="$CLOJURE_JAVA_OPTS -Djava.library.path=$CLOJURE_LIBRARY_PATH"
fi

cmd=`echo $rlwrap "$CLOJURE_JAVA" "$CLOJURE_JAVA_OPTS" -cp "$CLOJURE_CLASSPATH" $jline $main "$@"`
[ $verbose -eq 1 ] && echo "$cmd"
exec `echo $cmd`
