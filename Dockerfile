FROM bangn/ghc-8.6.3:lts-13.9 as builder

ENV APP sst-hrms

# Create /opt/$APP/bin and /opt/$APP/src.
# Set /opt/$APP/src as the working directory.
RUN mkdir -p /opt/$APP/src
RUN mkdir -p /opt/$APP/bin
WORKDIR /opt/$APP/src

COPY . .

# Build
RUN stack setup && stack build

# Copy executable file to bindir
RUN stack --local-bin-path=/opt/$APP/bin install

# Release
FROM heroku/heroku:18 as Release

ENV APP sst-hrms
ENV BINDIR /opt/$APP/bin

RUN mkdir /api

WORKDIR /api

COPY --from=builder $BINDIR/$APP $BINDIR/$APP

CMD $BINDIR/$APP
