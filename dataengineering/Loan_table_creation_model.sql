CREATE DATABASE loan_data_model;
USE loan_data_model;
CREATE TABLE loan_details_model (
	loan_status INT, 
    loan_amnt FLOAT, 
    emp_length FLOAT, 
    annual_inc FLOAT,
	fico_range_low FLOAT, 
    inq_last_6mths FLOAT, 
    mths_since_last_record FLOAT,
	open_acc FLOAT, 
    pub_rec FLOAT, 
    total_acc FLOAT, 
    acc_now_delinq FLOAT, 
    open_acc_6m FLOAT,
	open_act_il FLOAT, 
    open_il_12m FLOAT, 
    mths_since_rcnt_il FLOAT, 
    open_rv_12m FLOAT,
	inq_fi FLOAT, 
    total_cu_tl FLOAT, 
    inq_last_12m FLOAT, 
    acc_open_past_24mths FLOAT,
	mo_sin_old_il_acct FLOAT, 
    mo_sin_old_rev_tl_op FLOAT, 
    mo_sin_rcnt_rev_tl_op FLOAT,
	mort_acc FLOAT, 
    mths_since_recent_bc FLOAT, 
    mths_since_recent_bc_dlq FLOAT,
	mths_since_recent_inq FLOAT, 
    num_accts_ever_120_pd FLOAT, 
    num_actv_bc_tl FLOAT,
	num_actv_rev_tl FLOAT, 
    num_bc_sats FLOAT, 
    num_bc_tl FLOAT, 
    num_il_tl FLOAT,
	num_op_rev_tl FLOAT, 
    num_rev_accts FLOAT, 
    num_tl_120dpd_2m FLOAT, 
    num_tl_30dpd FLOAT,
	num_tl_op_past_12m FLOAT, 
    pct_tl_nvr_dlq FLOAT, 
    percent_bc_gt_75 FLOAT,
	pub_rec_bankruptcies FLOAT
    );   


SELECT *
FROM loan_details_model
LIMIT 10;