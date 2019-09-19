#include <pthread.h>

void startCpuLoadMeasurement() ;
void startMeminfo() ;

int main() {
    startCpuLoadMeasurement();
    startMeminfo();

    pthread_exit(nullptr);

    return 0;
}