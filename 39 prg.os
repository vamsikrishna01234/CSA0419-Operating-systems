#include <stdio.h>

#include <stdlib.h>

int abs_diff(int a, int b) {

    return a > b ? a - b : b - a;

}

int main() {

    int tracks[] = {55, 58, 60, 70, 18};

    int n = sizeof(tracks) / sizeof(tracks[0]);

    int head_position, direction, i, j, movement = 0;

    printf("Enter the initial head position: ");

    scanf("%d", &head_position);

    printf("Enter the direction (1 for moving towards higher tracks, -1 for moving towards lower tracks): ");

    scanf("%d", &direction);

    // Sorting the tracks in ascending order

    for (i = 0; i < n - 1; i++) {

        for (j = 0; j < n - i - 1; j++) {

            if (tracks[j] > tracks[j + 1]) {

                int temp = tracks[j];

                tracks[j] = tracks[j + 1];

                tracks[j + 1] = temp;

            }

        }

    }

    int current_track = head_position;

    int index = -1;

    // Finding the index of the head position in the sorted array

    for (i = 0; i < n; i++) {

        if (tracks[i] >= head_position) {

            index = i;

            break;

        }

    }

    if (index == -1) {

        printf("Invalid head position!\n");

        return 0;

    }

    printf("Sequence of tracks visited:\n");

    if (direction == 1) {

        // Moving towards higher tracks

        for (i = index; i < n; i++) {

            printf("%d ", tracks[i]);

            movement += abs_diff(current_track, tracks[i]);

            current_track = tracks[i];

        }

        for (i = index - 1; i >= 0; i--) {

            printf("%d ", tracks[i]);

            movement += abs_diff(current_track, tracks[i]);

            current_track = tracks[i];

        }

    } else if (direction == -1) {

        // Moving towards lower tracks

        for (i = index - 1; i >= 0; i--) {

            printf("%d ", tracks[i]);

            movement += abs_diff(current_track, tracks[i]);

            current_track = tracks[i];

        }

        for (i = index; i < n; i++) {

            printf("%d ", tracks[i]);

            movement += abs_diff(current_track, tracks[i]);

            current_track = tracks[i];

        }

    } else {

        printf("Invalid direction!\n");

        return 0;

    }

    printf("\n");

    printf("Average head movement: %.2f\n", (float)movement / n);

    return 0;

}
