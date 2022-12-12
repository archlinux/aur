#include <rocsolver/rocsolver.h>
#include <hip/hip_runtime.h>
#include <vector>
#include <random>
#include <algorithm>
#include <cmath>
#include <iostream>

int main()
{
    size_t n = 128;
    size_t size = n * n;

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dist(-1.0, 1.0);
    auto myrand = [&](){return dist(gen);};

    float *a;
    float *ipiv;
    hipMalloc((void**)&a, sizeof *a * size);
    hipMalloc((void**)&ipiv, sizeof *ipiv * n);

    std::vector<float> ain(size);
    std::generate(ain.begin(), ain.end(), myrand);

    hipMemcpy(a, ain.data(), sizeof *a * size, hipMemcpyHostToDevice);

    rocblas_handle handle;
    rocblas_create_handle(&handle);

    rocsolver_sgeqrf(handle, n, n, a, n, ipiv);

    std::vector<float> aout(size);
    hipMemcpy(aout.data(), a, sizeof *a * size, hipMemcpyDeviceToHost);

    std::cout << "TESTS PASSED!" << std::endl;

    hipFree(a);
    rocblas_destroy_handle(handle);
}
