FROM ghcr.io/mlflow/mlflow:v3.0.0rc0
# RUN apt-get update \
#     && apt-get -y install libpq-dev gcc \
#     && pip install psycopg2 \ 
#     && pip install azure-identity \
#     && pip install azure-storage-blob 
    
EXPOSE 5000
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000"]