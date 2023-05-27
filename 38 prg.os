#include <stdio.h>

struct Process {

    int pid;

    int burst_time;

};

void swap(struct Process *xp, struct Process *yp) {

    struct Process temp = *xp;

    *xp = *yp;

    *yp = temp;

}

void sort(struct Process processes[], int n) {

    int i, j;

    for (i = 0; i < n-1; i++) {

        for (j = 0; j < n-i-1; j++) {

            if (processes[j].burst_time > processes[j+1].burst_time) {

                swap(&processes[j], &processes[j+1]);

            }

        }

    }

}

void calculateWaitingTime(struct Process processes[], int n, int waiting_time[]) {

    waiting_time[0] = 0;

    for (int i = 1; i < n; i++) {

        waiting_time[i] = processes[i-1].burst_time + waiting_time[i-1];

    }

}

void calculateTurnaroundTime(struct Process processes[], int n, int waiting_time[], int turnaround_time[]) {

    for (int i = 0; i < n; i++) {

        turnaround_time[i] = processes[i].burst_time + waiting_time[i];

    }

}

void calculateAverageTimes(struct Process processes[], int n) {

    int waiting_time[n], turnaround_time[n];

    int total_waiting_time = 0, total_turnaround_time = 0;

    calculateWaitingTime(processes, n, waiting_time);

    calculateTurnaroundTime(processes, n, waiting_time, turnaround_time);

    printf("Process\tBurst Time\tWaiting Time\tTurnaround Time\n");

    for (int i = 0; i < n; i++) {

        total_waiting_time += waiting_time[i];

        total_turnaround_time += turnaround_time[i];

        printf("%d\t%d\t\t%d\t\t%d\n", processes[i].pid, processes[i].burst_time, waiting_time[i], turnaround_time[i]);

    }

    double avg_waiting_time = (double) total_waiting_time / n;

    double avg_turnaround_time = (double) total_turnaround_time / n;

    printf("\nAverage Waiting Time: %.2lf\n", avg_waiting_time);

    printf("Average Turnaround Time: %.2lf\n", avg_turnaround_time);

}

int main() {

    struct Process processes[] = {

        {0, 2},

        {1, 4},

        {2, 8}

    };

    int n = sizeof(processes) / sizeof(processes[0]);

    sort(processes, n);

    calculateAverageTimes(processes, n);

    return 0;

}
