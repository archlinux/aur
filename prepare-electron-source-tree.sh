#!/usr/bin/env rbash
set -e
# Generated file. Do not modify by hand.
# Usage: script <CARCH>
place_subproject_into_tree () {
    # place_subproject_into_tree flattened_path path should_copy
    local parent_dir="$(dirname "$2")"
    if [[ -n "$parent_dir" ]]; then
        mkdir -p "$parent_dir"
    fi
    # Remove the target dir
    rm -rf "$2"
    if [[ "$3" == "true" ]]; then
        cp -r "$1" "$2"
    else
        mv -v "$1" "$2"
    fi
}

CARCH="$1"
case "$CARCH" in
    x86_64)
        _go_arch=amd64;;
    *)
        _go_arch="$CARCH";;
esac

place_subproject_into_tree chromium-mirror src false
place_subproject_into_tree chromium-mirror_third_party_nan src/third_party/nan false
place_subproject_into_tree chromium-mirror_third_party_electron_node src/third_party/electron_node false
place_subproject_into_tree chromium-mirror_third_party_engflow-reclient-configs src/third_party/engflow-reclient-configs false
place_subproject_into_tree chromium-mirror_third_party_clang-format_script src/third_party/clang-format/script false
place_subproject_into_tree chromium-mirror_third_party_libc++_src src/third_party/libc++/src false
place_subproject_into_tree chromium-mirror_third_party_libc++abi_src src/third_party/libc++abi/src false
place_subproject_into_tree chromium-mirror_third_party_libunwind_src src/third_party/libunwind/src false
place_subproject_into_tree chromium-mirror_chrome_test_data_perf_canvas_bench src/chrome/test/data/perf/canvas_bench false
place_subproject_into_tree chromium-mirror_chrome_test_data_perf_frame_rate_content src/chrome/test/data/perf/frame_rate/content false
place_subproject_into_tree chromium-mirror_chrome_test_data_xr_webvr_info src/chrome/test/data/xr/webvr_info false
place_subproject_into_tree chromium-mirror_media_cdm_api src/media/cdm/api false
place_subproject_into_tree chromium-mirror_native_client src/native_client false
place_subproject_into_tree chromium-mirror_net_third_party_quiche_src src/net/third_party/quiche/src false
place_subproject_into_tree chromium-mirror_testing_libfuzzer_fuzzers_wasm_corpus src/testing/libfuzzer/fuzzers/wasm_corpus false
place_subproject_into_tree chromium-mirror_third_party_accessibility_test_framework_src src/third_party/accessibility_test_framework/src false
place_subproject_into_tree chromium-mirror_third_party_angle src/third_party/angle false
place_subproject_into_tree chromium-mirror_third_party_anonymous_tokens_src src/third_party/anonymous_tokens/src false
place_subproject_into_tree chromium-mirror_third_party_content_analysis_sdk_src src/third_party/content_analysis_sdk/src false
place_subproject_into_tree chromium-mirror_third_party_dav1d_libdav1d src/third_party/dav1d/libdav1d false
place_subproject_into_tree chromium-mirror_third_party_dawn src/third_party/dawn false
place_subproject_into_tree chromium-mirror_third_party_highway_src src/third_party/highway/src false
place_subproject_into_tree chromium-mirror_third_party_google_benchmark_src src/third_party/google_benchmark/src false
place_subproject_into_tree chromium-mirror_third_party_boringssl_src src/third_party/boringssl/src false
place_subproject_into_tree chromium-mirror_third_party_breakpad_breakpad src/third_party/breakpad/breakpad false
place_subproject_into_tree chromium-mirror_third_party_cast_core_public_src src/third_party/cast_core/public/src false
place_subproject_into_tree chromium-mirror_third_party_catapult src/third_party/catapult false
place_subproject_into_tree chromium-mirror_third_party_ced_src src/third_party/ced/src false
place_subproject_into_tree chromium-mirror_third_party_chromium-variations src/third_party/chromium-variations false
place_subproject_into_tree chromium-mirror_third_party_cld_3_src src/third_party/cld_3/src false
place_subproject_into_tree chromium-mirror_third_party_colorama_src src/third_party/colorama/src false
place_subproject_into_tree chromium-mirror_third_party_cpu_features_src src/third_party/cpu_features/src false
place_subproject_into_tree chromium-mirror_third_party_cpuinfo_src src/third_party/cpuinfo/src false
place_subproject_into_tree chromium-mirror_third_party_crc32c_src src/third_party/crc32c/src false
place_subproject_into_tree chromium-mirror_third_party_cros_system_api src/third_party/cros_system_api false
place_subproject_into_tree chromium-mirror_third_party_crossbench src/third_party/crossbench false
place_subproject_into_tree chromium-mirror_third_party_depot_tools src/third_party/depot_tools false
place_subproject_into_tree chromium-mirror_third_party_devtools-frontend_src src/third_party/devtools-frontend/src false
place_subproject_into_tree chromium-mirror_third_party_dom_distiller_js_dist src/third_party/dom_distiller_js/dist false
place_subproject_into_tree chromium-mirror_third_party_eigen3_src src/third_party/eigen3/src false
place_subproject_into_tree chromium-mirror_third_party_farmhash_src src/third_party/farmhash/src false
place_subproject_into_tree chromium-mirror_third_party_ffmpeg src/third_party/ffmpeg false
place_subproject_into_tree chromium-mirror_third_party_flac src/third_party/flac false
place_subproject_into_tree chromium-mirror_third_party_flatbuffers_src src/third_party/flatbuffers/src false
place_subproject_into_tree chromium-mirror_third_party_fontconfig_src src/third_party/fontconfig/src false
place_subproject_into_tree chromium-mirror_third_party_fp16_src src/third_party/fp16/src false
place_subproject_into_tree chromium-mirror_third_party_gemmlowp_src src/third_party/gemmlowp/src false
place_subproject_into_tree chromium-mirror_third_party_grpc_src src/third_party/grpc/src false
place_subproject_into_tree chromium-mirror_third_party_freetype_src src/third_party/freetype/src false
place_subproject_into_tree chromium-mirror_third_party_freetype-testing_src src/third_party/freetype-testing/src false
place_subproject_into_tree chromium-mirror_third_party_fxdiv_src src/third_party/fxdiv/src false
place_subproject_into_tree chromium-mirror_third_party_harfbuzz-ng_src src/third_party/harfbuzz-ng/src false
place_subproject_into_tree chromium-mirror_third_party_instrumented_libs src/third_party/instrumented_libs false
place_subproject_into_tree chromium-mirror_third_party_emoji-segmenter_src src/third_party/emoji-segmenter/src false
place_subproject_into_tree chromium-mirror_third_party_ots_src src/third_party/ots/src false
place_subproject_into_tree chromium-mirror_third_party_libgav1_src src/third_party/libgav1/src false
place_subproject_into_tree chromium-mirror_third_party_googletest_src src/third_party/googletest/src false
place_subproject_into_tree chromium-mirror_third_party_hunspell_dictionaries src/third_party/hunspell_dictionaries false
place_subproject_into_tree chromium-mirror_third_party_icu src/third_party/icu false
place_subproject_into_tree chromium-mirror_third_party_jsoncpp_source src/third_party/jsoncpp/source false
place_subproject_into_tree chromium-mirror_third_party_leveldatabase_src src/third_party/leveldatabase/src false
place_subproject_into_tree chromium-mirror_third_party_libFuzzer_src src/third_party/libFuzzer/src false
place_subproject_into_tree chromium-mirror_third_party_fuzztest_src src/third_party/fuzztest/src false
place_subproject_into_tree chromium-mirror_third_party_libaddressinput_src src/third_party/libaddressinput/src false
place_subproject_into_tree chromium-mirror_third_party_libaom_source_libaom src/third_party/libaom/source/libaom false
place_subproject_into_tree chromium-mirror_third_party_libavif_src src/third_party/libavif/src false
place_subproject_into_tree chromium-mirror_third_party_crabbyavif_src src/third_party/crabbyavif/src false
place_subproject_into_tree chromium-mirror_third_party_libavifinfo_src src/third_party/libavifinfo/src false
place_subproject_into_tree chromium-mirror_third_party_nearby_src src/third_party/nearby/src false
place_subproject_into_tree chromium-mirror_third_party_beto-core_src src/third_party/beto-core/src false
place_subproject_into_tree chromium-mirror_third_party_securemessage_src src/third_party/securemessage/src false
place_subproject_into_tree chromium-mirror_third_party_speedometer_v3.0 src/third_party/speedometer/v3.0 false
place_subproject_into_tree chromium-mirror_third_party_ukey2_src src/third_party/ukey2/src false
place_subproject_into_tree chromium-mirror_third_party_cros-components_src src/third_party/cros-components/src false
place_subproject_into_tree chromium-mirror_third_party_libdrm_src src/third_party/libdrm/src false
place_subproject_into_tree chromium-mirror_third_party_expat_src src/third_party/expat/src false
place_subproject_into_tree chromium-mirror_third_party_libipp_libipp src/third_party/libipp/libipp false
place_subproject_into_tree chromium-mirror_third_party_libjpeg_turbo src/third_party/libjpeg_turbo false
place_subproject_into_tree chromium-mirror_third_party_liblouis_src src/third_party/liblouis/src false
place_subproject_into_tree chromium-mirror_third_party_libphonenumber_dist src/third_party/libphonenumber/dist false
place_subproject_into_tree chromium-mirror_third_party_libprotobuf-mutator_src src/third_party/libprotobuf-mutator/src false
place_subproject_into_tree chromium-mirror_third_party_libsrtp src/third_party/libsrtp false
place_subproject_into_tree chromium-mirror_third_party_libsync_src src/third_party/libsync/src false
place_subproject_into_tree chromium-mirror_third_party_libvpx_source_libvpx src/third_party/libvpx/source/libvpx false
place_subproject_into_tree chromium-mirror_third_party_libwebm_source src/third_party/libwebm/source false
place_subproject_into_tree chromium-mirror_third_party_libwebp_src src/third_party/libwebp/src false
place_subproject_into_tree chromium-mirror_third_party_libyuv src/third_party/libyuv false
place_subproject_into_tree chromium-mirror_third_party_lss src/third_party/lss false
place_subproject_into_tree chromium-mirror_third_party_material_color_utilities_src src/third_party/material_color_utilities/src false
place_subproject_into_tree chromium-mirror_third_party_minigbm_src src/third_party/minigbm/src false
place_subproject_into_tree chromium-mirror_third_party_nasm src/third_party/nasm false
place_subproject_into_tree chromium-mirror_third_party_neon_2_sse_src src/third_party/neon_2_sse/src false
place_subproject_into_tree chromium-mirror_third_party_openh264_src src/third_party/openh264/src false
place_subproject_into_tree chromium-mirror_third_party_openscreen_src src/third_party/openscreen/src false
place_subproject_into_tree chromium-mirror_third_party_openxr_src src/third_party/openxr/src false
place_subproject_into_tree chromium-mirror_third_party_pdfium src/third_party/pdfium false
place_subproject_into_tree chromium-mirror_third_party_perfetto src/third_party/perfetto false
place_subproject_into_tree chromium-mirror_third_party_protobuf-javascript_src src/third_party/protobuf-javascript/src false
place_subproject_into_tree chromium-mirror_third_party_pthreadpool_src src/third_party/pthreadpool/src false
place_subproject_into_tree chromium-mirror_third_party_pyelftools src/third_party/pyelftools false
place_subproject_into_tree chromium-mirror_third_party_quic_trace_src src/third_party/quic_trace/src false
place_subproject_into_tree chromium-mirror_third_party_pywebsocket3_src src/third_party/pywebsocket3/src false
place_subproject_into_tree chromium-mirror_third_party_re2_src src/third_party/re2/src false
place_subproject_into_tree chromium-mirror_third_party_ruy_src src/third_party/ruy/src false
place_subproject_into_tree chromium-mirror_third_party_skia src/third_party/skia false
place_subproject_into_tree chromium-mirror_third_party_smhasher_src src/third_party/smhasher/src false
place_subproject_into_tree chromium-mirror_third_party_snappy_src src/third_party/snappy/src false
place_subproject_into_tree chromium-mirror_third_party_sqlite_src src/third_party/sqlite/src false
place_subproject_into_tree chromium-mirror_third_party_swiftshader src/third_party/swiftshader false
place_subproject_into_tree chromium-mirror_third_party_text-fragments-polyfill_src src/third_party/text-fragments-polyfill/src false
place_subproject_into_tree chromium-mirror_third_party_tflite_src src/third_party/tflite/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps src/third_party/vulkan-deps false
place_subproject_into_tree chromium-mirror_third_party_vulkan_memory_allocator src/third_party/vulkan_memory_allocator false
place_subproject_into_tree chromium-mirror_third_party_wayland_src src/third_party/wayland/src false
place_subproject_into_tree chromium-mirror_third_party_wayland-protocols_src src/third_party/wayland-protocols/src false
place_subproject_into_tree chromium-mirror_third_party_wayland-protocols_kde src/third_party/wayland-protocols/kde false
place_subproject_into_tree chromium-mirror_third_party_wayland-protocols_gtk src/third_party/wayland-protocols/gtk false
place_subproject_into_tree chromium-mirror_third_party_webdriver_pylib src/third_party/webdriver/pylib false
place_subproject_into_tree chromium-mirror_third_party_webgl_src src/third_party/webgl/src false
place_subproject_into_tree chromium-mirror_third_party_webgpu-cts_src src/third_party/webgpu-cts/src false
place_subproject_into_tree chromium-mirror_third_party_webrtc src/third_party/webrtc false
place_subproject_into_tree chromium-mirror_third_party_wuffs_src src/third_party/wuffs/src false
place_subproject_into_tree chromium-mirror_third_party_weston_src src/third_party/weston/src false
place_subproject_into_tree chromium-mirror_third_party_xdg-utils src/third_party/xdg-utils false
place_subproject_into_tree chromium-mirror_third_party_xnnpack_src src/third_party/xnnpack/src false
place_subproject_into_tree chromium-mirror_tools_page_cycler_acid3 src/tools/page_cycler/acid3 false
place_subproject_into_tree chromium-mirror_third_party_zstd_src src/third_party/zstd/src false
place_subproject_into_tree chromium-mirror_v8 src/v8 false
place_subproject_into_tree chromium-mirror_third_party_angle_third_party_glmark2_src src/third_party/angle/third_party/glmark2/src false
place_subproject_into_tree chromium-mirror_third_party_angle_third_party_rapidjson_src src/third_party/angle/third_party/rapidjson/src false
place_subproject_into_tree chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src src/third_party/angle/third_party/VK-GL-CTS/src false
place_subproject_into_tree chromium-mirror_third_party_dawn_buildtools src/third_party/dawn/buildtools false
place_subproject_into_tree src/third_party/clang-format/script src/third_party/dawn/third_party/clang-format/script true
git -C src/third_party/dawn/third_party/clang-format/script checkout --detach 8b525d2747f2584fc35d8c7e612e66f377858df7
place_subproject_into_tree src/third_party/depot_tools src/third_party/dawn/third_party/depot_tools true
git -C src/third_party/dawn/third_party/depot_tools checkout --detach 6e32e926e9de76137e2c60821bd2755924c65cf2
place_subproject_into_tree src/third_party/libc++/src src/third_party/dawn/third_party/libc++/src true
git -C src/third_party/dawn/third_party/libc++/src checkout --detach 278060665f956b98b54922e3cb5e38b07884ce7d
place_subproject_into_tree src/third_party/libc++abi/src src/third_party/dawn/third_party/libc++abi/src true
git -C src/third_party/dawn/third_party/libc++abi/src checkout --detach 0226cb1cdfe740b173394e1cebbd0dcf293e38ad
place_subproject_into_tree chromium-mirror_third_party_dawn_build src/third_party/dawn/build false
place_subproject_into_tree chromium-mirror_third_party_dawn_tools_clang src/third_party/dawn/tools/clang false
place_subproject_into_tree chromium-mirror_third_party_dawn_testing src/third_party/dawn/testing false
place_subproject_into_tree src/third_party/libFuzzer/src src/third_party/dawn/third_party/libFuzzer/src true
git -C src/third_party/dawn/third_party/libFuzzer/src checkout --detach 26cc39e59b2bf5cbc20486296248a842c536878d
place_subproject_into_tree src/third_party/googletest/src src/third_party/dawn/third_party/googletest true
git -C src/third_party/dawn/third_party/googletest checkout --detach 7a7231c442484be389fdf01594310349ca0e42a8
place_subproject_into_tree src/third_party/catapult src/third_party/dawn/third_party/catapult true
git -C src/third_party/dawn/third_party/catapult checkout --detach dd218dfd815774289f8a81015f7a3131f72afbde
place_subproject_into_tree src/third_party/google_benchmark/src src/third_party/dawn/third_party/google_benchmark/src true
git -C src/third_party/dawn/third_party/google_benchmark/src checkout --detach efc89f0b524780b1994d5dddd83a92718e5be492
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_jinja2 src/third_party/dawn/third_party/jinja2 false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_markupsafe src/third_party/dawn/third_party/markupsafe false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_glfw src/third_party/dawn/third_party/glfw false
place_subproject_into_tree src/third_party/vulkan_memory_allocator src/third_party/dawn/third_party/vulkan_memory_allocator true
git -C src/third_party/dawn/third_party/vulkan_memory_allocator checkout --detach 52dc220fb326e6ae132b7f262133b37b0dc334a3
place_subproject_into_tree src/third_party/angle src/third_party/dawn/third_party/angle true
git -C src/third_party/dawn/third_party/angle checkout --detach 8d23fa3f92ed6a40ee1950aea9e0f300caeebe31
place_subproject_into_tree src/third_party/swiftshader src/third_party/dawn/third_party/swiftshader true
git -C src/third_party/dawn/third_party/swiftshader checkout --detach da334852e70510d259bfa8cbaa7c5412966b2f41
place_subproject_into_tree src/third_party/vulkan-deps src/third_party/dawn/third_party/vulkan-deps true
git -C src/third_party/dawn/third_party/vulkan-deps checkout --detach 4a16c52263574aabe420ba7c87b772c70027386b
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_zlib src/third_party/dawn/third_party/zlib false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_abseil-cpp src/third_party/dawn/third_party/abseil-cpp false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_dxc src/third_party/dawn/third_party/dxc false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_dxheaders src/third_party/dawn/third_party/dxheaders false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_webgpu-headers src/third_party/dawn/third_party/webgpu-headers false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_khronos_OpenGL-Registry src/third_party/dawn/third_party/khronos/OpenGL-Registry false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_khronos_EGL-Registry src/third_party/dawn/third_party/khronos/EGL-Registry false
place_subproject_into_tree src/third_party/webgpu-cts/src src/third_party/dawn/third_party/webgpu-cts true
git -C src/third_party/dawn/third_party/webgpu-cts checkout --detach 4629efe685b7b8db08e1c7aa2cafd1e9e5769ac2
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_protobuf src/third_party/dawn/third_party/protobuf false
place_subproject_into_tree chromium-mirror_third_party_dawn_tools_protoc_wrapper src/third_party/dawn/tools/protoc_wrapper false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_jsoncpp src/third_party/dawn/third_party/jsoncpp false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_langsvr src/third_party/dawn/third_party/langsvr false
place_subproject_into_tree chromium-mirror_third_party_dawn_third_party_partition_alloc src/third_party/dawn/third_party/partition_alloc false
place_subproject_into_tree src/third_party/dawn/buildtools src/third_party/openscreen/src/buildtools true
git -C src/third_party/openscreen/src/buildtools checkout --detach 4e0e9c73a0f26735f034f09a9cab2a5c0178536b
place_subproject_into_tree chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src src/third_party/openscreen/src/third_party/tinycbor/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_glslang_src src/third_party/vulkan-deps/glslang/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_spirv-cross_src src/third_party/vulkan-deps/spirv-cross/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_spirv-headers_src src/third_party/vulkan-deps/spirv-headers/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_spirv-tools_src src/third_party/vulkan-deps/spirv-tools/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_vulkan-headers_src src/third_party/vulkan-deps/vulkan-headers/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_vulkan-loader_src src/third_party/vulkan-deps/vulkan-loader/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_vulkan-tools_src src/third_party/vulkan-deps/vulkan-tools/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_vulkan-utility-libraries_src src/third_party/vulkan-deps/vulkan-utility-libraries/src false
place_subproject_into_tree chromium-mirror_third_party_vulkan-deps_vulkan-validation-layers_src src/third_party/vulkan-deps/vulkan-validation-layers/src false
cp gclient_args.gni src/build/config/gclient_args.gni
cipd install chromium/third_party/screen-ai/linux version:124.00 -root src/third_party/screen-ai/linux
cipd install infra/3pp/tools/esbuild/linux-${_go_arch} version:2@0.14.13.chromium.2 -root src/third_party/devtools-frontend/src/third_party/esbuild
# Unhandled gcs dependency src/third_party/js_code_coverage: {'dep_type': 'gcs', 'condition': 'checkout_js_coverage_modules and non_git_source', 'bucket': 'chromium-nodejs', 'objects': [{'object_name': 'js_code_coverage/d538975c93eefc7bafd599b50f867e90c1ef17f3', 'sha256sum': '646bb00ced0a930b2eb1e4dbcfac18ebbb8f889bb80599e0254d9d6505427914', 'size_bytes': 1469185, 'generation': 1657780123604338}]}
# Unhandled gcs dependency src/buildtools/linux64/format: {'bucket': 'chromium-clang-format', 'condition': 'host_os == "linux" and non_git_source', 'dep_type': 'gcs', 'objects': [{'object_name': 'b42097ca924d1f1736a5a7806068fed9d7345eb4', 'sha256sum': '82df59a7d4390892c3eeaf0c8bf626e2869f1138a6ad3eb90dd51da0011ba630', 'size_bytes': 3539912, 'generation': 1699478806427152, 'output_file': 'clang-format'}]}
# Unhandled gcs dependency src/third_party/tfhub_models: {'bucket': 'chromium-tfhub-models', 'dep_type': 'gcs', 'objects': [{'object_name': '0f037afd23a02321520951afd5c2c6078d26cbf1', 'sha256sum': '7130f43eb9889ff4dcd36ed2c5352053b88216e6b9186dfce08ea41b7dd142f3', 'size_bytes': 35504613, 'generation': 1691086948259727}]}
# Unhandled gcs dependency src/third_party/blink/renderer/core/css/perftest_data: {'dep_type': 'gcs', 'condition': 'non_git_source', 'bucket': 'chromium-style-perftest', 'objects': [{'object_name': 'e9ce994346c62f8c9fd6d0cecb2b2b0b93b4c2d8', 'sha256sum': '519019df16c628c6c0893df18928faeaa3150a9d8f26a787a16ce7c6b2cec2ad', 'size_bytes': 601672, 'generation': 1664794185950162, 'output_file': 'ecommerce.json'}, {'object_name': '756068da5e551516b23b0ba133e55c144f623d38', 'sha256sum': '84ef87a8163335a95111d9709306596f96742539da0b34fbe7397f799946a168', 'size_bytes': 2156935, 'generation': 1664794188995509, 'output_file': 'encyclopedia.json'}, {'object_name': '314e4e0d5e89ea9e9e9a234c617b4413adf48aa9', 'sha256sum': 'a721ada40011a286631baae6d76878f2023ff000151792228c83b1958ea8a197', 'size_bytes': 608840, 'generation': 1664794191929032, 'output_file': 'extension.json'}, {'object_name': '3a19b42a7c46257b716d55d6733f070c87180b1e', 'sha256sum': 'f203ff9e8c8a6a3b714f0a26db38cc940544a907435c62c79b21f4bd3f8bee8e', 'size_bytes': 1750837, 'generation': 1664794194891567, 'output_file': 'news.json'}, {'object_name': 'fdc43ee18cbd65487249441849f58aa13484aaef', 'sha256sum': '0e92de92f49abc9a521f7175106c80744196f8cefc0263bc0f4a6b4f724a7d10', 'size_bytes': 1310798, 'generation': 1664794197855470, 'output_file': 'search.json'}, {'object_name': '7fc9338af75b7d9d185c91ddf262a356def5623d', 'sha256sum': '34e92acae8aade2a186abe79ed1f379c266f04f72f1eb54bd3a912e889bc5cc0', 'size_bytes': 2280846, 'generation': 1664794200867034, 'output_file': 'social1.json'}, {'object_name': 'c2d7e9ce67522dad138c7feb0a6911b828bfb130', 'sha256sum': '95c6b148577b891310c024b2daa5d68faf644a37707ac0cb21501eefe8a399a3', 'size_bytes': 411708, 'generation': 1664794203829582, 'output_file': 'social2.json'}, {'object_name': '031d5599c8a21118754e30dbea141be66104f556', 'sha256sum': '8e7b765d72bb8e7742f5bf955f4bf64d5469f61197dad8b632304095a52322d7', 'size_bytes': 3203922, 'generation': 1664794206824773, 'output_file': 'sports.json'}, {'object_name': '8aac3db2a8c9e44babec81e539a3d60aeab4985c', 'sha256sum': '6aeb0036dfafaf5e905abdb0ffe515a3952ffe35a7c59afb0fc8b233b27c6ce4', 'size_bytes': 5902660, 'generation': 1664794209886788, 'output_file': 'video.json'}]}
# Unhandled gcs dependency src/tools/perf/page_sets/maps_perf_test/: {'dep_type': 'gcs', 'condition': 'non_git_source', 'bucket': 'chromium-telemetry', 'objects': [{'object_name': 'e6bf26977c2fd80c18789d1f279d474096a7b0d1', 'sha256sum': 'f5f7fe360ad2b9c3d9dda2612f17336c0541bac15b4e4992f2c167e059a190fa', 'size_bytes': 3285237, 'generation': 1513305740113238, 'output_file': 'load_dataset'}]}
# Unhandled gcs dependency src/third_party/opus/tests/resources: {'dep_type': 'gcs', 'condition': 'non_git_source', 'bucket': 'chromium-webrtc-resources', 'objects': [{'object_name': '009a3ee778767c2402b1d2c920bc2449265f5a2c', 'sha256sum': '34de3161f242895a682d9cdcbbf4ad50246742b6db46873386104cfde8a24332', 'size_bytes': 26889600, 'generation': 1392811661954000, 'output_file': 'speech_mono_32_48kHz.pcm'}]}
# Unhandled gcs dependency src/third_party/subresource-filter-ruleset/data: {'dep_type': 'gcs', 'condition': 'non_git_source', 'bucket': 'chromium-ads-detection', 'objects': [{'object_name': 'e4d1c702ca1b5497a3abcdd9495a5d0758f19ffc', 'sha256sum': 'ae2fd01d2908591e0f39343a5b4a78baa8e7d6cac9d78ba79c502fe0a15ce3ee', 'size_bytes': 70106, 'generation': 1695223938564350, 'output_file': 'UnindexedRules'}]}
# Unhandled gcs dependency src/third_party/test_fonts: {'dep_type': 'gcs', 'condition': 'non_git_source', 'bucket': 'chromium-fonts', 'objects': [{'object_name': '336e775eec536b2d785cc80eff6ac39051931286', 'sha256sum': 'a2ca2962daf482a8f943163541e1c73ba4b2694fabcd2510981f2db4eda493c8', 'size_bytes': 32624734, 'generation': 1647440500943755}]}