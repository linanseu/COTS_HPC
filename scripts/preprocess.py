#!/usr/bin/python

import numpy as np
import Image



def test_load_data():
    #load data
    train_X_file =  open("../data/stl10/train_X.bin", "rb")
    data = np.fromfile(train_X_file, dtype=np.uint8)
    data = data.reshape(5000, 3, 96*96)

    #show image
    #data loading is column-major, need to transfer
    a = np.column_stack([data[1][0], data[1][1], data[1][2]])
    a = a.reshape(96, 96, 3)
    im = Image.fromarray(a, 'RGB')
    im.save("test.png")

if __name__ == "__main__":
    test_load_data()
