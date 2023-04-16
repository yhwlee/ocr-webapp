import shutil 
import os
import requests as req

def _save_file_to_server(uploaded_file, path=".", save_as="default"):
    file_location = os.path.abspath(uploaded_file.filename)

    with open(file_location, "wb") as buffer:
        shutil.copyfileobj(uploaded_file.file, buffer)
    return file_location
