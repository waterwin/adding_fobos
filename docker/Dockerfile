#recipe for building libfobos base for ka9q-radio containerized from script
#PE3ES 15-5-2026
FROM ubuntu:24.04 AS base

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

#use libfobos.sh from ~ folder
RUN echo '#!/bin/bash\n\
RUN ~/libfobos.sh .

#give container something to do
ENTRYPOINT ["/bin/bash"] 
CMD ["docker exec -ti bash"]
