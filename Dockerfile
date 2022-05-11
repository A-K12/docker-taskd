ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

# Install necessary stuff
RUN apk -U --no-progress upgrade && \
  apk -U --no-progress add taskd taskd-pki

# Import build and startup script
COPY .circleci/run.sh /app/taskd/

# Set the data location
ARG TASKDDATA
ENV TASKDDATA ${TASKDDATA:-/var/taskd}

# Configure container
ENTRYPOINT ["/app/taskd/run.sh"]
