

def get_expected_output(n1, n2):
    try:
        x, y = int(float(n1)), int(float(n2))
        return str(x + y)
    except ValueError:
        return 'NaN'
