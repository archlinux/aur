#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>
#include <errno.h>
#include <assert.h>

#include "execinfo.h"

#define MAX_FRAMES 64
#define TEST_ITERATIONS 1000

/* Test result structure */
typedef struct {
    const char *name;
    int passed;
    int failed;
    double duration_ms;
} test_result_t;

/* Forward declarations */
static void print_trace_basic(void);
static void print_trace_detailed(void);
static void test_basic_functionality(test_result_t *result);
static void test_edge_cases(test_result_t *result);
static void test_performance(test_result_t *result);
static void test_symbols_fd(test_result_t *result);
static double get_time_ms(void);
static void recursive_function(int depth, int max_depth);

/**
 * Basic backtrace printing function
 */
static void
print_trace_basic(void)
{
    void *array[MAX_FRAMES];
    size_t size;
    char **strings;
    size_t i;

    size = backtrace(array, MAX_FRAMES);
    strings = backtrace_symbols(array, size);

    if (strings == NULL) {
        printf("ERROR: backtrace_symbols failed\n");
        return;
    }

    printf("=== Basic Backtrace (%zu frames) ===\n", size);
    for (i = 0; i < size; i++) {
        printf("[%2zu] %s\n", i, strings[i]);
    }
    printf("\n");

    free(strings);
}

/**
 * Detailed backtrace with additional information
 */
static void
print_trace_detailed(void)
{
    void *array[MAX_FRAMES];
    size_t size;
    int i;

    size = backtrace(array, MAX_FRAMES);
    
    printf("=== Detailed Backtrace (%zu frames) ===\n", size);
    printf("Raw addresses:\n");
    for (i = 0; i < (int)size; i++) {
        printf("[%2d] %p\n", i, array[i]);
    }
    
    printf("\nSymbolic information:\n");
    backtrace_symbols_fd(array, size, STDOUT_FILENO);
    printf("\n");
}

/**
 * Test basic functionality
 */
static void
test_basic_functionality(test_result_t *result)
{
    void *array[MAX_FRAMES];
    char **strings;
    int size;
    double start_time = get_time_ms();

    printf("Running basic functionality tests...\n");
    
    /* Test 1: Basic backtrace */
    size = backtrace(array, MAX_FRAMES);
    if (size > 0) {
        result->passed++;
        printf("✓ backtrace() returned %d frames\n", size);
    } else {
        result->failed++;
        printf("✗ backtrace() failed\n");
    }

    /* Test 2: Symbol resolution */
    if (size > 0) {
        strings = backtrace_symbols(array, size);
        if (strings != NULL) {
            result->passed++;
            printf("✓ backtrace_symbols() succeeded\n");
            free(strings);
        } else {
            result->failed++;
            printf("✗ backtrace_symbols() failed\n");
        }
    }

    /* Test 3: File descriptor output */
    if (size > 0) {
        printf("✓ Testing backtrace_symbols_fd():\n");
        backtrace_symbols_fd(array, size, STDOUT_FILENO);
        result->passed++;
    }

    result->duration_ms = get_time_ms() - start_time;
}

/**
 * Test edge cases and error conditions
 */
static void
test_edge_cases(test_result_t *result)
{
    void *array[MAX_FRAMES];
    char **strings;
    int size;
    double start_time = get_time_ms();

    printf("Running edge case tests...\n");

    /* Test 1: Zero size */
    size = backtrace(array, 0);
    if (size == 0) {
        result->passed++;
        printf("✓ backtrace(0) correctly returned 0\n");
    } else {
        result->failed++;
        printf("✗ backtrace(0) returned %d (expected 0)\n", size);
    }

    /* Test 2: NULL buffer */
    size = backtrace(NULL, 10);
    if (size == 0) {
        result->passed++;
        printf("✓ backtrace(NULL) correctly returned 0\n");
    } else {
        result->failed++;
        printf("✗ backtrace(NULL) returned %d (expected 0)\n", size);
    }

    /* Test 3: Large size request */
    size = backtrace(array, MAX_FRAMES);
    printf("✓ backtrace(%d) returned %d frames\n", MAX_FRAMES, size);
    result->passed++;

    /* Test 4: NULL symbols */
    strings = backtrace_symbols(NULL, 5);
    if (strings == NULL) {
        result->passed++;
        printf("✓ backtrace_symbols(NULL) correctly returned NULL\n");
    } else {
        result->failed++;
        printf("✗ backtrace_symbols(NULL) should return NULL\n");
        free(strings);
    }

    /* Test 5: Zero count symbols */
    size = backtrace(array, 1);
    if (size > 0) {
        strings = backtrace_symbols(array, 0);
        if (strings == NULL) {
            result->passed++;
            printf("✓ backtrace_symbols(0) correctly returned NULL\n");
        } else {
            result->failed++;
            printf("✗ backtrace_symbols(0) should return NULL\n");
            free(strings);
        }
    }

    result->duration_ms = get_time_ms() - start_time;
}

/**
 * Performance testing
 */
static void
test_performance(test_result_t *result)
{
    void *array[MAX_FRAMES];
    char **strings;
    int i, size;
    double start_time, end_time;

    printf("Running performance tests (%d iterations)...\n", TEST_ITERATIONS);

    /* Backtrace performance */
    start_time = get_time_ms();
    for (i = 0; i < TEST_ITERATIONS; i++) {
        size = backtrace(array, MAX_FRAMES);
        if (size <= 0) {
            result->failed++;
            break;
        }
    }
    end_time = get_time_ms();
    
    if (size > 0) {
        result->passed++;
        printf("✓ backtrace(): %.2f ms total, %.4f ms/call\n", 
               end_time - start_time, (end_time - start_time) / TEST_ITERATIONS);
    }

    /* Symbol resolution performance */
    size = backtrace(array, MAX_FRAMES);
    if (size > 0) {
        start_time = get_time_ms();
        for (i = 0; i < TEST_ITERATIONS / 10; i++) {  /* Fewer iterations - more expensive */
            strings = backtrace_symbols(array, size);
            if (strings != NULL) {
                free(strings);
            } else {
                result->failed++;
                break;
            }
        }
        end_time = get_time_ms();
        
        if (strings != NULL || i > 0) {
            result->passed++;
            printf("✓ backtrace_symbols(): %.2f ms total, %.4f ms/call\n", 
                   end_time - start_time, (end_time - start_time) / (TEST_ITERATIONS / 10));
        }
    }

    result->duration_ms = get_time_ms() - start_time;
}

/**
 * Test symbols_fd function
 */
static void
test_symbols_fd(test_result_t *result)
{
    void *array[MAX_FRAMES];
    int size;
    double start_time = get_time_ms();

    printf("Testing backtrace_symbols_fd()...\n");

    size = backtrace(array, 5);  /* Just a few frames */
    if (size > 0) {
        printf("Output to stdout:\n");
        backtrace_symbols_fd(array, size, STDOUT_FILENO);
        result->passed++;
        printf("✓ backtrace_symbols_fd() completed\n");
    } else {
        result->failed++;
        printf("✗ Could not get backtrace for symbols_fd test\n");
    }

    result->duration_ms = get_time_ms() - start_time;
}

/**
 * Recursive function for deeper stack testing
 */
static void
recursive_function(int depth, int max_depth)
{
    if (depth >= max_depth) {
        printf("=== Recursive Backtrace (depth %d) ===\n", depth);
        print_trace_basic();
        return;
    }
    recursive_function(depth + 1, max_depth);
}

/**
 * Get current time in milliseconds
 */
static double
get_time_ms(void)
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec * 1000.0 + tv.tv_usec / 1000.0;
}

/**
 * Dummy function to make backtrace more interesting
 */
static void
dummy_function(void)
{
    print_trace_detailed();
}

/**
 * Main test runner
 */
int
main(void)
{
    test_result_t tests[] = {
        {"Basic Functionality", 0, 0, 0.0},
        {"Edge Cases", 0, 0, 0.0},
        {"Performance", 0, 0, 0.0},
        {"Symbols FD", 0, 0, 0.0}
    };
    int num_tests = sizeof(tests) / sizeof(tests[0]);
    int i, total_passed = 0, total_failed = 0;

    printf("libexecinfo Test Suite\n");
    printf("======================\n\n");

    /* Run basic demonstration */
    printf("=== Basic Demonstration ===\n");
    dummy_function();

    /* Test recursive calls */
    recursive_function(0, 5);

    printf("=== Automated Tests ===\n");

    /* Run all tests */
    test_basic_functionality(&tests[0]);
    test_edge_cases(&tests[1]);
    test_performance(&tests[2]);
    test_symbols_fd(&tests[3]);

    /* Print summary */
    printf("\n=== Test Summary ===\n");
    for (i = 0; i < num_tests; i++) {
        printf("%-20s: %d passed, %d failed (%.2f ms)\n",
               tests[i].name, tests[i].passed, tests[i].failed, tests[i].duration_ms);
        total_passed += tests[i].passed;
        total_failed += tests[i].failed;
    }

    printf("\nOverall: %d passed, %d failed\n", total_passed, total_failed);
    
    if (total_failed == 0) {
        printf("🎉 All tests passed!\n");
        return EXIT_SUCCESS;
    } else {
        printf("❌ Some tests failed.\n");
        return EXIT_FAILURE;
    }
}
