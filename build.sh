#!/usr/bin/env bash

SRCDIR=$1;

rm -rf build/;
mkdir -p build/;

total_count=$(find "${SRCDIR}/" -type f -name "*.scel" | wc -l);
progress=0;
all_dict_file=$(mktemp "build/alldict-XXX.txt");
find "${SRCDIR}/" -type f -name "*.scel" | while read -r scel_file
do
    ((++progress));

    temp_dict_txt_file=$(mktemp "build/tempdict-XXXXXX.txt");
    if ! scel2org5 "${scel_file}" -o "${temp_dict_txt_file}" > /dev/null 2>&1; then
        echo "Build ${scel_file} error"
        # continuelo
    fi

    cat "${temp_dict_txt_file}" >> "${all_dict_file}"

    if [ "${progress}" -eq "${total_count}" ]; then
        percent=100
        filled=40
    else
        # 计算百分比
        percent=$(( progress * 100 / total_count ))
        # 计算已填充的进度条长度
        filled=$(( progress * 40 / total_count ))
    fi

    # 构建进度条字符串
    bar=""
    for (( i=0; i<filled; i++ )); do
        bar="$bar#"
    done
    for (( i=filled; i<40; i++ )); do
        bar="$bar "
    done

    # 打印进度条并回车，覆盖当前行
    printf "\rBuild [%s] %d%%" "$bar" "$percent"
done
printf "\nBuild completed\n"

libime_pinyindict "${all_dict_file}" "build/sogou-input-dict.dict"