#include <stdio.h>

#define MAX 28123

int is_abundant(int n)
{
    int i = 1;
    int sum_of_divisors = 0;
    for (i = 1; i * i <= n; ++i)
    {
        if (n % i == 0)
        {
            sum_of_divisors += i;
            if (i != (n / i))
            {
                sum_of_divisors += (n / i);
            }
        }
    }

    return (n < (sum_of_divisors -n));
}

int main()
{
    int abundant_numbers[10000] = {0};
    int abundant_count = 0;

    int i = 0;
    for (i = 0; i < MAX; ++i)
    {
        if (is_abundant(i))
        {
            abundant_numbers[abundant_count] = i; 
            ++abundant_count;
        }
    }

    int sum_of_abundants[MAX * 2 + 1] = {0};

    int j = 0;
    for (i = 0; i < abundant_count; ++i)
    {
        for (j = 0; j < abundant_count; ++j)
        {
            sum_of_abundants[abundant_numbers[i] + abundant_numbers[j]] = 1;
        }
    }

    int result_sum = 0;
    for (i = 1; i < MAX; ++i)
    {
        if (!sum_of_abundants[i])
        {
            result_sum += i;
        }
    }

    printf("%d\n", result_sum);
    return 0;
}
