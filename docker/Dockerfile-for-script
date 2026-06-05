#recipe for building libfobos base for ka9q-radio containerized from script
#PE3ES 15-5-2026
FROM ubuntu:24.04 AS base

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install some build dependencies and helpful utilities
RUN apt-get update && \
    apt-get install -y \
    nano \
    sudo \
    usbutils \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /build

# Copy my libfobos source
COPY . .

#use libfobscript.sh from ~/src folder
RUN echo "Begin script"
#RUN echo '#!/bin/bash\n\
#RUN ../src/libfobscript.sh .
RUN echo "End script"

#give container something to do
# ENTRYPOINT ["/bin/bash"] 
#CMD [/bin/bash -c "echo 'Hello World'; cat"]
# Specify the command or entrypoint to keep the container running
CMD ["tail", "-f", "/dev/null"]
