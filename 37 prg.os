#include <stdio.h>

#define MAX_FRAMES 10

int findOptimalPage(int pages[], int n, int frames[], int numFrames, int startIndex) {

    int res = -1, farthest = startIndex;

    for (int i = 0; i < numFrames; i++) {

        int j;

        for (j = startIndex; j < n; j++) {

            if (frames[i] == pages[j]) {

                if (j > farthest) {

                    farthest = j;

                    res = i;

                }

                break;

            }

        }

        if (j == n)

            return i;

    }

    return (res == -1) ? 0 : res;

}

int isPagePresent(int page, int frames[], int numFrames) {

    for (int i = 0; i < numFrames; i++) {

        if (frames[i] == page)

            return 1;

    }

    return 0;

}

void printPageFaults(int pages[], int n, int numFrames) {

    int frames[MAX_FRAMES];

    int numFaults = 0;

    for (int i = 0; i < numFrames; i++)

        frames[i] = -1;

    for (int i = 0; i < n; i++) {

        if (!isPagePresent(pages[i], frames, numFrames)) {

            int j = findOptimalPage(pages, n, frames, numFrames, i + 1);

            frames[j] = pages[i];

            numFaults++;

        }

        printf("Page %d -> [", pages[i]);

        for (int j = 0; j < numFrames; j++) {

            if (frames[j] == -1)

                printf(" ");

            else

                printf("%d", frames[j]);

            if (j != numFrames - 1)

                printf(", ");

        }

        printf("]\n");

    }

    printf("Total Page Faults: %d\n", numFaults);

}

int main() {

    int pages[] = {4, 1, 2, 4, 3, 2, 1, 5};

    int numFrames = 3;

    int numPages = sizeof(pages) / sizeof(pages[0]);

    printPageFaults(pages, numPages, numFrames);

    return 0;

}
