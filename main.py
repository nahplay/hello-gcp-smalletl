import os
from google.cloud import storage
import datetime
import time


def get_env_variables(env_file):
    with open(env_file) as f:
        for line in f:
            key, value = line.strip().split("=")
            os.environ[key] = value


def extract_from_source():
    pass


def load_gcp(source, current_date):
    client = storage.Client()
    bucket = client.bucket(os.environ['PROJECT_BUCKET'])

    blob = bucket.blob(f'{source}/load_date={current_date}/{source}_{int(time.time())}.csv')
    blob.upload_from_filename(f'{source}.csv')

    print("Data is successfully uploaded to Google Cloud Storage")


def main():
    # Get env variables
    get_env_variables('envs.env')

    # Create current date for further partitioning
    current_date = datetime.datetime.now().date()
    load_gcp('bike_data', current_date)


if __name__ == "__main__":
    main()
