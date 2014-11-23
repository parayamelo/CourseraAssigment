Since I wanted to make a simple, straight forward code, I divided the coding
in several steps. Unfortunately, this, sometimes has the disadvantage of
using several variables as well.

For the first part, we extracted the data from both the training and test 
data files, were we used the variables:

x_train, y_train, subject_train, x_test, y_test, subject_test.

As their names indicates, the names of the variables are just the names
of the ascii files containing the data.

We then created a x_data, y_data and subject_data where we merged both the
train and test data.

For the second part, we extracted the "features" data from the features file,
naming this variable as feat.

The same was done for the "activities" description. This variable is named
actitivities.

Finally, all the data was merged into one big data table, named all_data. 