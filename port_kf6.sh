#!/usr/bin/env sh

find -type f \( -name 'CMakeLists.txt' -o -iname '*.cmake' -o -iname '*.cmake.in' -o -iname '*.pc.in' \) -print0 | xargs -0 sed -i 's/Qt5/Qt6/g'
find -type f \( -name 'CMakeLists.txt' -o -iname '*.cmake' -o -iname '*.cmake.in' -o -iname '*.pc.in' \) -print0 | xargs -0 sed -i 's/KF5/KF6/g'
find -type f \( -name 'CMakeLists.txt' -o -iname '*.cmake' -o -iname '*.cmake.in' -o -iname '*.sh' -o -iname '*.md' -o -iname '*.categories' -o -iname '*.json' -o -iname '*.h' -o -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/kf5/kf6/g'
find -type f \( -name 'CMakeLists.txt' -o -iname '*.cmake' -o -iname '*.pc.in' -o -iname '*.sh' -o -iname '*.h' -o -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/kde5/kde6/g'
find -type f \( -iname '*.h' -o -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/_KF5/_KF6/g'
find -type f \( -iname '*.h' -o -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/Plasma::AbstractRunner/KRunner::AbstractRunner/g'
find -type f \( -iname '*.h' -o -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/Plasma::QueryMatch/KRunner::QueryMatch/g'
find -type f \( -iname '*.h' -o -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/Plasma::RunnerContext/KRunner::RunnerContext/g'
find -type f \( -iname '*.h' -o -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/Plasma::RunnerManager/KRunner::RunnerManager/g'
find -type f \( -iname '*.h' -o -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/Plasma::RunnerSyntax/KRunner::RunnerSyntax/g'
find ! -path '*.git*' -type f -name '*KF5*' -print0 | xargs -0 -r rename 'KF5' 'KF6'
find ! -path '*.git*' -type f -name 'kf5*' -print0 | xargs -0 -r rename 'kf5' 'kf6'
find ! -path '*.git*' -type f -name 'kde5*' -print0 | xargs -0 -r rename 'kde5' 'kde6'

