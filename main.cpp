#include <pthread.h>

void startCpuLoadMeasurement() ;

int main() {
    startCpuLoadMeasurement();

    pthread_exit(NULL);

    return 0;
}