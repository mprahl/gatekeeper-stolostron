FROM golang:1.23-bullseye@sha256:48ac5022f9740543cac0eba41a4e37b721073a0103349e416678e0142a53b49a

RUN GO111MODULE=on go install sigs.k8s.io/controller-tools/cmd/controller-gen@v0.10.0
RUN GO111MODULE=on go install k8s.io/code-generator/cmd/conversion-gen@v0.25.4

RUN mkdir /gatekeeper
WORKDIR /gatekeeper
