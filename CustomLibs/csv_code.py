import csv


def read_csv_file(filename):
    data = []
    with open(filename, 'rt') as csv_file:
        reader = csv.reader(csv_file)
        for row in reader:
            data.append(row)
    return data

