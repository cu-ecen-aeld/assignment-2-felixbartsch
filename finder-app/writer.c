#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <syslog.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[])
{
    openlog("writer", 0, LOG_USER);
    if (argc != 3)
    {
        syslog(LOG_ERR, "Unexpected number of arguments");
        return 1;
    }
    char* writefile = argv[1];
    char* writestr = argv[2];
    int fd = open(writefile, O_WRONLY | O_CREAT, 0666);
    if (fd == -1)
    {
        syslog(LOG_ERR, "Could not open file %s", writefile);
        return 1;
    }
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    write (fd, writestr, strlen(writestr));
    int status = close(fd);
    if (status == -1)
    {
        syslog(LOG_ERR, "Could not close file %s", writefile);
        return 1;
    }
    closelog();
    return 0;
}
