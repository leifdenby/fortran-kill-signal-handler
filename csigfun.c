#include <signal.h>

typedef void (*sighandler_t)(int);

void register_kill_signal_handler_(sighandler_t handler)
{
  signal(SIGINT, handler);
  signal(SIGTERM, handler);
}
