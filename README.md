# Docker Container Configuration
I have been working with docker for a little while and wanted to share a basic container layout. I have put this concept together from observing layouts, googling, and general aha moments while trying to get a container running smoothly.

## Dockerfile layout

## COPY /root, but not that root

## Initialize
If the container is not in the state at which the service it'll run needs to be, we need to put it into that state.

>initialize = set to the value or put in the condition appropriate to the start of an operation.

## Start

## Stop

## References
* [Google'ing](www.google.com)
* [Centurylink Dev Blog - start trap loop](https://www.ctl.io/developers/blog/post/gracefully-stopping-docker-containers)
* [Serverfault - log to stdout](https://serverfault.com/questions/599103/make-a-docker-application-write-to-stdout)
