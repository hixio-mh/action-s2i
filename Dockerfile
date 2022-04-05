FROM alpine:3.15.4

LABEL version="1.0.0"
LABEL repository="http://github.com/vrutkovs/action-s2i"
LABEL homepage="http://github.com/vrutkovs/action-s2i"
LABEL maintainer="Vadim Rutkovsky"
LABEL "com.github.actions.name"="Source2Image build"
LABEL "com.github.actions.description"="Runs source2image build"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="purple"

RUN apk --no-cache add bash curl tar && \
    cd /tmp && \
    curl -L https://github.com/openshift/source-to-image/releases/download/v1.2.0/source-to-image-v1.2.0-2a579ecd-linux-amd64.tar.gz | tar xvz && \
    cp /tmp/s2i /usr/bin/

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
