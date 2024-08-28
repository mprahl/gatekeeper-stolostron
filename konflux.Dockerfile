FROM registry.access.redhat.com/ubi9/go-toolset:1.21.11-7.1724233645 as builder
USER 0
ENV LDFLAGS="-X github.com/open-policy-agent/gatekeeper/v3/pkg/version.Version=v3.15.1" \
    GO111MODULE=on \
    CGO_ENABLED=1

WORKDIR /go/src/github.com/open-policy-agent/gatekeeper
COPY . .

RUN go build -mod vendor -a -ldflags "${LDFLAGS}" -o manager

FROM registry.access.redhat.com/ubi9/ubi-minimal:latest
WORKDIR /
COPY --from=builder /go/src/github.com/open-policy-agent/gatekeeper/manager .
RUN microdnf -y update && microdnf -y clean all
USER 65532:65532
ENTRYPOINT ["/manager"]
