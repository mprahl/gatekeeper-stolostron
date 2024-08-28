FROM golang:1.21-bullseye@sha256:40a67e6626bead90d5c7957bd0354cfeb8400e61acc3adc256e03252630014a6

RUN GO111MODULE=on go install sigs.k8s.io/controller-tools/cmd/controller-gen@v0.10.0
RUN GO111MODULE=on go install k8s.io/code-generator/cmd/conversion-gen@v0.25.4

RUN mkdir /gatekeeper
WORKDIR /gatekeeper
