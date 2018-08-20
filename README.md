# Docker Container Configuration

I have been working with docker for a little while and wanted to share a basic container layout. I have put this concept together from observing layouts, googling, and general aha moments while trying to get a container running smoothly.

## Dockerfile layout

Make sure that ENV FUNCTIONS is defined and call your init script.

## COPY /root_d

When files can be copied into the container, "root_d" can be used. "root_d" signifies the container OS root directory structure. Copy in the things you need with one command where they need to be. There comes a time when you may need to copy in a file before the RUN, and then copy in files after. For example a config file.

## Initialize

If the container is not in the state at which the service it will run needs to be, we need to put it into that state.

>initialize = set to the value or put in the condition appropriate to the start of an operation.

## Start

The start function is used to call all functions that get the environment setup. Somewhere along the way the start will call the service the container is responsible for.

## Stop

The stop function is used to stop the service inside smoothly, and then exit.

## References

* [Google'ing](www.google.com)
* [Centurylink Dev Blog - start trap loop](https://www.ctl.io/developers/blog/post/gracefully-stopping-docker-containers)
* [Serverfault - log to stdout](https://serverfault.com/questions/599103/make-a-docker-application-write-to-stdout)
* [https://docs.docker.com/config/containers/multi-service_container/](https://docs.docker.com/config/containers/multi-service_container/)
