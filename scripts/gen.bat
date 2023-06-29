RMDIR /S /Q synthetic-data
MKDIR synthetic-data synthetic-data\images
ECHO '*' > synthetic-data\.gitignore
python3 generate_dataset.py
