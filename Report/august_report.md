Report End August - 04/09/2016

-------------------------
During this month, I managed to complete and debug the python script used for converting the .json file into a .csv <br /> <br />
Using R, i managed to produce a correlation matrix between all variables, in order to check correlations between columns.<br />
As regarding the Machine Learning, I encountered several problems with DCAFPilot regarding the compatibility with FTS format, different from the supported PopDB data format. After a few changes in the DCAF source code, I started to train a classification model (with RandomForestClassifier classificator) using as target column the delta transfer time. For target threshold I choose 1h and 2h of delta transfer time (in the R histogram I plotted the number of events function of the delta transfer time). <br /> Also, for each case, I modified the number of column drops during the transformation process, in order to see if there was any improvement dropping more or less correlated columns.

Results are shown in this table:

|   | True Positive (TP) | True Negative (TN) | False Positive (FP) | False Negative (FN) | True positive Rate (TPR) | True Negative Rate (TNR) | Accuracy | Precision | Recall | F1
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 1h delta -> drop with correlation +- 0.6   | 391303 | 113009 | 882 | 313 | 0.999200747671 | 0.992261868206 | 0.997636457495 | 0.997751061361 | 0.999200747671 | 0.998475378317 | 
| 1h delta -> drop with correlation +- 0.4  | 387187 | 81055 | 32926 | 3799 | 0.990299170616 | 0.711127293145 | 0.927363097487 | 0.921743201907 | 0.990299170616 | 0.9547921547 | 
| 1h delta -> drop with correlation +- 0.7  | 391279 | 112288 | 1693 | 337 | 0.999139463148 | 0.985146647248 | 0.995984944531 | 0.995691805014 | 0.999139463148 | 0.997412654795 | 
| 2h delta -> drop with correlation +- 0.6   | 391303 | 113009 | 882 | 313 | 0.999200747671 | 0.992261868206 | 0.997636457495 | 0.997751061361 | 0.999200747671 | 0.998475378317 | 
| 2h delta -> drop with correlation +- 0.4  | 387187 | 81055 | 32926 | 3799 | 0.990299170616 | 0.711127293145 | 0.927363097487 | 0.921743201907 | 0.990299170616 | 0.9547921547 | 
| 2h delta -> drop with correlation +- 0.7  | 391279 | 112288 | 1693 | 337 | 0.999139463148 | 0.985146647248 | 0.995984944531 | 0.995691805014 | 0.999139463148 | 0.997412654795 | 

Some considerations: dropping only the variables with more than 0.6 correlation (or less than -0.6) factor produces better results than dropping a lot of column with less correlation. Another consideration: there is no difference between a threshold of 1h and 2h.

------------------------

Tommaso
