options(repos = c(CRAN = "http://cran.rstudio.com"))

install.packages('remotes')
install.packages('reticulate')
reticulate::install_miniconda()

install.packages('keras')

library(keras)
install_keras()

reticulate::py_run_string("import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))")

install.packages('data.table')