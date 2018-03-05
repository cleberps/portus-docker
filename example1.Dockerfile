FROM portus.ssys.local/sles12sp2
MAINTAINER Cleber Paiva de Souza "cleber@ssys.com.br"
   
ARG repo
ARG cert
   
RUN echo "$cert" > /etc/pki/trust/anchors/RHN-ORG-TRUSTED-SSL-CERT.pem
RUN update-ca-certificates
RUN echo "$repo" > /etc/zypp/repos.d/susemanager:dockerbuild.repo
   
# ... do the required tasks
zypper --non-interactive in python
zypper --non-interactive in python-xml

RUN rm -f /etc/zypp/repos.d/susemanager:dockerbuild.repo
