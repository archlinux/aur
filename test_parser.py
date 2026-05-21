import sys
sys.path.append("/home/marley/git/FastFlowLM-gtk")
import utils

sample_code = """```c
#include <stdio.h>
int main() {
    printf("Hello World");
    return 0;
}
```"""

print(utils.parse_message(sample_code))
