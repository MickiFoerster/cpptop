#include <stdlib.h>
#include <cstring>
#include <errno.h>
#include <stdio.h>
#include <pthread.h>
#include "yystype.h"

int main() {
    pthread_t tid;
    int err = pthread_create(&tid, NULL, taskMeasureCPULoad, NULL);
    if (err) {
        fprintf(stderr, "could create thread: %s", strerror(errno));
        exit(1);
    }
    pthread_join(tid, NULL);

    return 0;
}