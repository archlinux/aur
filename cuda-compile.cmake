function(get_native_cuda_archs output_var)
    execute_process(
        COMMAND ${CMAKE_CUDA_COMPILER} -arch=native --dryrun -x cu /dev/null
        OUTPUT_VARIABLE nvcc_output
        ERROR_VARIABLE nvcc_error)

    string(REGEX MATCH "-D__CUDA_ARCH_LIST__=([0-9,]+)" match "${nvcc_error}")
    if(match)
        string(REGEX REPLACE "-D__CUDA_ARCH_LIST__=([0-9,]+)" "\\1" arch_list
                             "${match}")
        set(${output_var}
            "${arch_list}"
            PARENT_SCOPE)
    else()
        message(FATAL_ERROR "Failed to detect native CUDA architectures.")
    endif()
endfunction()

get_native_cuda_archs(CUDA_ARCH_LIST)
message(STATUS "Detected CUDA architectures: ${CUDA_ARCH_LIST}")

target_compile_definitions(
    cugraph_c
    PRIVATE "$<$<COMPILE_LANGUAGE:CXX>:__CUDA_ARCH_LIST__=${CUDA_ARCH_LIST}>")
