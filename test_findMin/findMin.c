#include <stdio.h>

int findMin (int a[], int n);

int main(void) {


    int array[] = { 
        5, 8, 3, -2, 10, 4
    };
    int n = 6;

    int smallest = findMin(array, n);

    printf("Smallest = %d\n", smallest);
    return 0;

}

int findMin (int a[], int n) {


    int small = a[0];
    for (int i = 1; i < n; i ++) {
        if (a[i] < small) {
            small = a[i];
        }

    }
    return small;

};