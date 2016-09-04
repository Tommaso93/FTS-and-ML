{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf470
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;\red0\green0\blue0;\red83\green83\blue83;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww25100\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 Report End August - 04/09/2016\
\
-------------------------\
\pard\pardeftab720\partightenfactor0
\cf2 \expnd0\expndtw0\kerning0
During this month, I managed to complete and debug the python script used for converting the .json file into a .csv\
Using R, i managed to produce a correlation matrix between all variables, in order to check correlations between columns.\
As regarding the Machine Learning, I encountered several problems with DCAFPilot regarding the compatibility with FTS format, different from the supported PopDB data format. After a few changes in the DCAF source code, I started to train a classification model (with RandomForestClassifier classificator) using as target column the delta transfer time. For target threshold I choose 1h and 2h of delta transfer time (in the R histogram I plotted the number of events function of the delta transfer time). Also, for each case, I modified the number of column drops during the transformation process, in order to see if there was any improvement dropping more or less correlated columns.\
\
Results are shown in this table:\
\
\pard\pardeftab720\partightenfactor0
\cf3 |   | True Positive (TP) | True Negative (TN) | False Positive (FP) | False Negative (FN) | True positive Rate (TPR) | True Negative Rate (TNR) | Accuracy | Precision | Recall | F1\
| ------------- | ------------- |\cf0  ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |\cf3 \
| 1h delta -> drop with correlation +- 0.6   | \cf2 391303\cf3  | 113009 \cf0 | 882 | 313 | \cf2 0.999200747671\cf0  | \cf2 0.992261868206\cf0  | \cf2 0.997636457495\cf0  | \cf2 0.997751061361 | 0.999200747671 | 0.998475378317 | \cf3 \
| 1h delta -> drop with correlation +- 0.4  \cf0 | \cf2 387187\cf0  | 81055 | 32926 | 3799 | \cf2 0.990299170616\cf0  | \cf2 0.711127293145\cf0  | \cf2 0.927363097487\cf0  | \cf2 0.921743201907\cf2  | \cf2 0.990299170616\cf2  | \cf2 0.9547921547\cf2  | \cf0 \kerning1\expnd0\expndtw0 \
\pard\pardeftab720\partightenfactor0
\cf0 \expnd0\expndtw0\kerning0
| 1h delta -> drop with correlation +- 0.7  | \cf2 391279\cf0  | 112288 | 1693 | 337 | \cf2 0.999139463148\cf0  | \cf2 0.985146647248\cf0  | \cf2 0.995984944531\cf0  | \cf2 0.995691805014\cf2  | \cf2 0.999139463148\cf2  | \cf2 0.997412654795\cf2  | \
\cf0 | 2h delta -> drop with correlation +- 0.6   | \cf2 391303\cf0  | 113009 | 882 | 313 | \cf2 0.999200747671\cf0  | \cf2 0.992261868206\cf0  | \cf2 0.997636457495\cf0  | \cf2 0.997751061361 | 0.999200747671 | 0.998475378317 | \cf0 \kerning1\expnd0\expndtw0 \
\expnd0\expndtw0\kerning0
| 2h delta -> drop with correlation +- 0.4  | \cf2 387187\cf0  | 81055 | 32926 | 3799 | \cf2 0.990299170616\cf0  | \cf2 0.711127293145\cf0  | \cf2 0.927363097487\cf0  | \cf2 0.921743201907 | 0.990299170616 | 0.9547921547 | \
\cf0 | 2h delta -> drop with correlation +- 0.7  | \cf2 391279\cf0  | 112288 | 1693 | 337 | \cf2 0.999139463148\cf0  | \cf2 0.985146647248\cf0  | \cf2 0.995984944531\cf0  | \cf2 0.995691805014 | 0.999139463148 | 0.997412654795 | \
\
\pard\pardeftab720\partightenfactor0
\cf2 Some considerations: dropping only the variables with more than 0.6 correlation (or less than -0.6) factor produces better results than dropping a lot of column with less correlation. Another consideration: there is no difference between a threshold of 1h and 2h.\cf2 \
\cf0 \kerning1\expnd0\expndtw0 \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 ------------------------\
\
Tommaso}