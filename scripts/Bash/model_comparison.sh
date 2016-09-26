#!/bin/bash


source /data/srv/current/apps/DCAFPilot/etc/profile.d/init.sh

echo Choosing Different models for ML with 0.6 >> log_transcript_06

transform_csv --fin=/afs/cern.ch/work/t/tdiotale/test_2016/train_merge2.csv --fout=train_clf.csv --target=tr_timestamp_complete_minus_tr_timestamp_start --target-thr=60000 --drops=block_size,channel_type,file_metadata%activity,file_metadata%adler32,file_metadata%dest_rse_id,file_metadata%dst_rse,file_metadata%dst_type,file_metadata%md5,file_metadata%name,file_metadata%request_id,file_metadata%request_type,file_metadata%scope,file_metadata%src_rse,file_metadata%src_rse_id,file_metadata%src_type,job_metadata%issuer,job_metadata%multi_sources,job_state,nstreams,retry_max,srm_space_token_dst,t_failure_phase,t_final_transfer_state,t_timeout,tcp_buf_size,time_srm_fin_end,time_srm_fin_st,time_srm_prep_end,time_srm_prep_st,timestamp_checksum_dest_ended,timestamp_checksum_dest_st,timestamp_chk_src_ended,timestamp_chk_src_st,timestamp_tr_comp,timestamp_tr_st,tr_bt_transfered,tr_error_category,tr_error_scope,tr_timestamp_complete,tr_timestamp_start --verbose --log-all --log-bias=5 >> log_transcript_06

transform_csv --fin=/afs/cern.ch/work/t/tdiotale/test_2016/valid_merge2.csv --fout=valid_clf.csv --target=tr_timestamp_complete_minus_tr_timestamp_start --target-thr=60000 --drops=block_size,channel_type,file_metadata%activity,file_metadata%adler32,file_metadata%dest_rse_id,file_metadata%dst_rse,file_metadata%dst_type,file_metadata%md5,file_metadata%name,file_metadata%request_id,file_metadata%request_type,file_metadata%scope,file_metadata%src_rse,file_metadata%src_rse_id,file_metadata%src_type,job_metadata%issuer,job_metadata%multi_sources,job_state,nstreams,retry_max,srm_space_token_dst,t_failure_phase,t_final_transfer_state,t_timeout,tcp_buf_size,time_srm_fin_end,time_srm_fin_st,time_srm_prep_end,time_srm_prep_st,timestamp_checksum_dest_ended,timestamp_checksum_dest_st,timestamp_chk_src_ended,timestamp_chk_src_st,timestamp_tr_comp,timestamp_tr_st,tr_bt_transfered,tr_error_category,tr_error_scope,tr_timestamp_complete,tr_timestamp_start --verbose --log-all --log-bias=5 >> log_transcript_06

echo Linear SVC >> log_transcript_06

model --learner=LinearSVC --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo RandomForestClassifier >> log_transcript_06

model --learner=RandomForestClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo ExtraTreesClassifier >> log_transcript_06

model --learner=ExtraTreesClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo GaussianNB >> log_transcript_06

model --learner=GaussianNB --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo BernoulliNB >> log_transcript_06

model --learner=BernoulliNB --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo SGDClassifier >> log_transcript_06

model --learner=SGDClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo Ridge Classifier >> log_transcript_06

model --learner=RidgeClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo GradientBoostingClassifier >> log_transcript_06

model --learner=GradientBoostingClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo DecisionTreeClassifier >> log_transcript_06

model --learner=DecisionTreeClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo AdaBoostClassifier >> log_transcript_06

model --learner=AdaBoostClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo Bagging Classifier >> log_transcript_06

model --learner=BaggingClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo XGBClassifier >> log_transcript_06

model --learner=XGBClassifier --idcol=id --target=target --train-file=train_clf.csv --scaler=StandardScaler --predict=pred.txt --newdata=valid_clf.csv --split=0.32 >> log_transcript_06

check_prediction --fin=valid_clf.csv --fpred=pred.txt --scorer=tp,tn,fp,fn,tpr,tnr,fpr,fnr,accuracy,precision,recall,f1 >> log_transcript_06

echo Script Finished, Sending email to tommaso.diotalevi@cern.ch ... >> log_transcript_06
NOW=$(date)
cat log_transcript_06 | mailx -s "[Script completed at: $NOW]" tommaso.diotalevi@cern.ch

