FROM croservices/cro-http:0.7.6
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN zef install --deps-only . && perl6 -c -Ilib service.p6
ENV JOANPUJOL_PORT="3000" JOANPUJOL_HOST="0.0.0.0"
EXPOSE 10000
CMD perl6 -Ilib service.p6
