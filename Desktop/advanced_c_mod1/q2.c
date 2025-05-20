#include <stdio.h>
#include <stdlib.h>


void rearrange(int *arr, int n) {
    int *temp = (int *)malloc(n * sizeof(int));
    int *ptr = arr;
    int *tempPtr = temp;

    
    for (int i = 0; i < n; i++) {
        if (*(ptr + i) % 2 == 0) {
            *tempPtr = *(ptr + i);
            tempPtr++;
        }
    }

    
    for (int i = 0; i < n; i++) {
        if (*(ptr + i) % 2 != 0) {
            *tempPtr = *(ptr + i);
            tempPtr++;
        }
    }

    
    for (int i = 0; i < n; i++) {
        *(ptr + i) = *(temp + i);
    }

    free(temp);
}

int main() {
    int arr[] = {1, 2, 3, 4, 5, 6,7,8,9,10};
    int n = sizeof(arr) / sizeof(arr[0]);

    rearrange(arr, n);

    printf("Rearranged array: ");
    for (int i = 0; i < n; i++) {
        printf("%d ", *(arr + i));
    }
    return 0;
}

