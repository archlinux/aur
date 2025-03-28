#!/usr/bin/env bash

set -euo pipefail

state_dir="${XDG_DATA_HOME:-"$HOME/.local/share"}/starsector"
saves_path="${state_dir}/saves"
mods_path="${state_dir}/mods"
screenshots_path="${state_dir}/screenshots"
log_path="$state_dir"

mkdir -p "$saves_path"
mkdir -p "$mods_path"
mkdir -p "$screenshots_path"
mkdir -p "$log_path"

classpath="$(find '/usr/share/java/starsector' -type f -name '*.jar' | paste -sd ':')"

config_path="${XDG_CONFIG_HOME:-"$HOME/.config"}/starsector"
startup_config="${config_path}/startup.sh"

jvm_args=(-Xms2048m -Xmx2048m -Xss4m)
program_args=()

if [ -r "$startup_config" ]
then
  . "$startup_config"
fi

cd /usr/share/starsector
exec java \
  -Dfile.encoding=UTF-8 \
  -noverify \
  -XX:+UnlockDiagnosticVMOptions \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+ShowCodeDetailsInExceptionMessages \
  -XX:+ExtensiveErrorReports \
  -XX:+ShowMessageBoxOnError \
  -XX:+PrintCommandLineFlags \
  -XX:+TieredCompilation \
  -XX:-UseCondCardMark \
  -Xlog:async \
  -XX:+UseFastStosb \
  -XX:+AlwaysCompileLoopMethods \
  -XX:TieredStopAtLevel=4 \
  -XX:TrimNativeHeapInterval=60000 \
  -XX:+UseCriticalCompilerThreadPriority \
  -XX:+UseCriticalJavaThreadPriority \
  -XX:UseAVX=3 \
  -XX:AVX3Threshold=0 \
  -XX:UseSSE=4 \
  -XX:+UseSSE42Intrinsics \
  -XX:+UseCompressedOops \
  -XX:+UseCompressedClassPointers \
  -XX:+UseFMA \
  -XX:+UseBMI1Instructions \
  -XX:+UseBMI2Instructions \
  -XX:+UseCLMUL \
  -XX:+UseFastUnorderedTimeStamps \
  -XX:+UseUnalignedLoadStores \
  -XX:+UseXMMForArrayCopy \
  -XX:+UseXMMForObjInit \
  -XX:+UseXmmI2D \
  -XX:+UseXmmI2F \
  -XX:+DisableExplicitGC \
  -XX:+AlwaysPreTouch \
  -XX:+ParallelRefProcEnabled \
  -XX:+UseShenandoahGC \
  -XX:ShenandoahGCMode=iu \
  -XX:ShenandoahGCHeuristics=compact \
  -XX:ShenandoahAllocationThreshold=85 \
  -XX:ShenandoahGuaranteedGCInterval=0 \
  -XX:+ZeroTLAB \
  -XX:+SegmentedCodeCache \
  -XX:+AlwaysAtomicAccesses \
  -XX:+UseStringDeduplication \
  -XX:-DontCompileHugeMethods \
  -XX:Tier0Delay=1 \
  -XX:+UseFPUForSpilling \
  -XX:+EnableVectorAggressiveReboxing \
  -XX:+EnableVectorReboxing \
  -XX:+EnableVectorSupport \
  -XX:-AlignVector \
  -XX:TieredOldPercentage=10000 \
  -XX:Tier0ProfilingStartPercentage=2000 \
  -XX:IncreaseFirstTierCompileThresholdAt=99 \
  -XX:InterpreterProfilePercentage=99 \
  -XX:+UseVectorCmov \
  -XX:+UseVectorStubs \
  -XX:ReferencesPerThread=0 \
  -XX:MaxGCPauseMillis=10 \
  -XX:-EnableThreadSMRStatistics \
  -XX:+UseUnalignedAccesses \
  -XX:PerMethodRecompilationCutoff=100000 \
  -XX:ProfileMaturityPercentage=100 \
  -XX:NmethodSweepActivity=1 \
  -XX:ThreadPriorityPolicy=1 \
  -XX:ReservedCodeCacheSize=256m \
  -XX:+PrintCodeCache \
  -XX:-UseDynamicNumberOfCompilerThreads \
  -XX:CompilerDirectivesFile=./compiler_directives.txt \
  -Djava.library.path=/usr/lib/starsector \
  -XX:-BytecodeVerificationLocal \
  -XX:-BytecodeVerificationRemote \
  -Djava.util.Arrays.useLegacyMergeSort=true \
  --enable-preview \
  --add-opens=java.base/sun.nio.ch=ALL-UNNAMED \
  --add-opens=java.base/java.nio=ALL-UNNAMED \
  --add-opens=java.base/java.nio.Buffer.UNSAFE=ALL-UNNAMED \
  --add-opens=java.base/java.util=ALL-UNNAMED \
  --add-opens=java.base/java.util.concurrent=ALL-UNNAMED \
  --add-opens=java.base/java.util.concurrent.locks=ALL-UNNAMED \
  --add-opens=java.base/jdk.internal.ref=ALL-UNNAMED \
  --add-opens=java.base/java.lang.reflect=ALL-UNNAMED \
  --add-opens=java.base/java.lang.ref=ALL-UNNAMED \
  --add-opens=java.base/java.text=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt.font=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt.Rectangle=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt=ALL-UNNAMED \
  --add-exports=java.base/jdk.internal.ref=ALL-UNNAMED \
  --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED \
  --add-exports=java.base/sun.nio.ch=ALL-UNNAMED \
  -Dcom.fs.starfarer.settings.paths.saves="${saves_path}" \
  -Dcom.fs.starfarer.settings.paths.screenshots="${screenshots_path}" \
  -Dcom.fs.starfarer.settings.paths.mods="${mods_path}" \
  -Dcom.fs.starfarer.settings.paths.logs="${log_path}" \
  -Dcom.fs.starfarer.settings.linux=true \
  -classpath "${classpath}" \
  "${jvm_args[@]}" \
  com.fs.starfarer.StarfarerLauncher \
  "${program_args[@]}" \
  "$@"

