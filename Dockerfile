FROM daptin/daptin
RUN mkdir -p /opt/daptin/gallery/images
RUN chmod 777 -R /opt/daptin/gallery/images
COPY schema_image-gallery_daptin.yaml /opt/daptin/schema_image-gallery_daptin.yaml
COPY initial_data.json /opt/daptin/initial_data.json
COPY web /opt/daptin/gallery