import csv
import os

import faker_code


def read_csv_file(filename):
    data = []
    with open(filename, 'rt') as csv_file:
        reader = csv.reader(csv_file)
        for row in reader:
            data.append(row)
    return data


def create_csv_file(directory_path, test_case_name):
    file_path = directory_path + test_case_name

    validate = remove_file(file_path)
    if validate:
        filename = open(file_path + ".csv", "x")
        filename.close()
    else:
        filename = open(file_path + ".csv", "x")
        filename.close()


def add_row_to_csv(path, test_case_name, values):
    values = list(values.split(","))
    length = len(values)
    with open(path + test_case_name + ".csv", 'a') as filename:
        for i in range(len(values)):
            row_info = faker_code.call_function(values[i])
            filename.write(row_info)
            if i < (int(length) - 1):
                filename.write(",")
            if i == (int(length) - 1):
                filename.write("\n")
        filename.close()


def remove_file(filepath):
    try:
        os.remove(filepath + ".csv")
        return True
    except FileNotFoundError:
        return False
