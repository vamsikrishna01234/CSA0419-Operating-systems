#include<stdio.h>

#include<stdlib.h>

// Function to sort the track positions in ascending order

void sortTracks(int *tracks, int size) {

    int i, j, temp;

    for (i = 0; i < size - 1; i++) {

        for (j = 0; j < size - i - 1; j++) {

            if (tracks[j] > tracks[j + 1]) {

                temp = tracks[j];

                tracks[j] = tracks[j + 1];

                tracks[j + 1] = temp;

            }

        }

    }

}

// Function to find the index of the track position nearest to the head position

int findNearestTrack(int *tracks, int size, int head) {

    int i, minDiff = abs(tracks[0] - head), minIndex = 0;

    for (i = 1; i < size; i++) {

        if (abs(tracks[i] - head) < minDiff) {

            minDiff = abs(tracks[i] - head);

            minIndex = i;

        }

    }

    return minIndex;

}

// Function to calculate the total head movement

int calculateHeadMovement(int *tracks, int size, int head) {

    int i, currentTrack, nextTrack, headMovement = 0;

    int nearestTrack = findNearestTrack(tracks, size, head);

    

    currentTrack = head;

    for (i = 0; i < size; i++) {

        nextTrack = tracks[nearestTrack];

        headMovement += abs(nextTrack - currentTrack);

        currentTrack = nextTrack;

        nearestTrack = (nearestTrack + 1) % size;

    }

    return headMovement;

}

int main() {

    int numTracks = 5;

    int trackPositions[] = {55, 58, 60, 70, 18};

    int headPosition = 50;  // Assuming the initial head position

    

    sortTracks(trackPositions, numTracks);

    

    int totalHeadMovement = calculateHeadMovement(trackPositions, numTracks, headPosition);

    float averageHeadMovement = (float) totalHeadMovement / numTracks;

    

    printf("Average Head Movement: %.2f\n", averageHeadMovement);

    

    return 0;

}
