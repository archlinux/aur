#include <hipblas/hipblas.h>
#include <hip/hip_runtime.h>
#include <vector>
#include <random>
#include <algorithm>
#include <cmath>
#include <iostream>

int main()
{
    size_t n = 64;
    size_t m = 41;
    size_t size = n * n;

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dist(-1.0, 1.0);
    auto myrand = [&](){return dist(gen);};

    float *a;
    float *ac;
    int *ipiv;
    float *x;
    float *r;
    hipMalloc((void**)&a, sizeof *a * size);
    hipMalloc((void**)&ac, sizeof *ac * size);
    hipMalloc((void**)&ipiv, sizeof *ipiv * n);
    hipMalloc((void**)&x, sizeof *x * n * m);
    hipMalloc((void**)&r, sizeof *r * n * m);

    std::vector<float> ain(size);
    std::vector<float> xin(n * m);
    std::generate(ain.begin(), ain.end(), myrand);
    std::generate(xin.begin(), xin.end(), myrand);

    hipMemcpy(a, ain.data(), sizeof *a * size, hipMemcpyHostToDevice);
    hipMemcpy(ac, ain.data(), sizeof *ac * size, hipMemcpyHostToDevice);
    hipMemcpy(x, xin.data(), sizeof *x * n * m, hipMemcpyHostToDevice);
    hipMemcpy(r, xin.data(), sizeof *x * n * m, hipMemcpyHostToDevice);

    hipblasHandle_t handle;
    hipblasCreate(&handle);

    int *info;
    hipMalloc((void**)&info, sizeof *info);

    hipblasSgetrf(handle, n, a, n, ipiv, info);

    int hinfo[1];
    hipblasSgetrs(handle, HIPBLAS_OP_N, n, m, a, n, 
        ipiv, x, n, &hinfo[0]);

    float alpha = 1.0;
    float beta = -1.0;
    hipblasSgemm(handle, HIPBLAS_OP_N, HIPBLAS_OP_N, n, m, n,
        &alpha, ac, n, x, n, &beta, r, n); 

    std::vector<float> rout(n * m);
    hipMemcpy(rout.data(), r, sizeof *r * n * m, hipMemcpyDeviceToHost);

    float tol = 0.001f;
    for(size_t i = 0; i < n; i++){
        for(size_t j = 0; j < m; j++){
            if(std::abs(rout[i]) > tol){
            std::cout << "Missmatch at index " << i << "," << j << "\n"
                << "Desired: 0" << "\n"
                << "Actual : " << rout[i + j * n] << std::endl;
            return 1;
            }
        }
    }

    std::cout << "TESTS PASSED!" << std::endl;

    hipFree(a);
    hipFree(ac);
    hipFree(ipiv);
    hipFree(x);
    hipFree(r);
    hipFree(info);
    hipblasDestroy(handle);
}
