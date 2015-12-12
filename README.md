# mbacoach

In order to run the Estimated Probabilities feature, perform the following steps:

1. Install R.

  ```
  sudo apt-get update
  sudo apt-get install r-base
  ```
    
2. Install necessary packages. Type `R` to start up the R console. Once the R console is open, install the following packages using the commands

  ```
  install.packages("h2o")
  install.packages("data.table")
  ```

3. Edit the R library path in Line 2 of predict.R to point to the package installation directory for your system.

4. The folder in the repository called "GLM_model_R_1449540108308_5" contains the prediction model. Copy this into your root directory. Edit the path in Line 12 of predict.R to point to this directory on your system.

5. You should be ready to run Estimated Probabilities. Contact me if you have any difficulty.
