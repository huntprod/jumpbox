#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

static void done(int sig) {
	psignal(sig, "shutting down; caught signal");
	exit(0);
}

static void reap(int _) {
	while (waitpid(-1, NULL, WNOHANG) > 0);
}

int main() {
	struct sigaction sa;

	memset(&sa, 0, sizeof(sa));
	sa.sa_handler = done;
	if (sigaction(SIGTERM, &sa, NULL) < 0) {
		perror("failed to set up SIGTERM handler");
		exit(1);
	}

	memset(&sa, 0, sizeof(sa));
	sa.sa_handler = done;
	if (sigaction(SIGINT, &sa, NULL) < 0) {
		perror("failed to set up SIGINT handler");
		exit(1);
	}

	memset(&sa, 0, sizeof(sa));
	sa.sa_handler = reap;
	sa.sa_flags = SA_NOCLDSTOP;
	if (sigaction(SIGCHLD, &sa, NULL) < 0) {
		perror("failed to set up SIGCHLD handler");
		exit(1);
	}

	for (;;) pause();
	fprintf(stderr, "oops: pause loop bailed out somehow...\n");
	exit(2);
}
