import csv


def read_csv_file(path):
    data = []
    with open(path, 'rt') as csv_file:
        reader = csv.reader(csv_file)
        for row in reader:
            data.append(row)
    return data

