CREATE DATABASE loan_data_operational;

USE loan_data_operational;

 CREATE TABLE loan_details_main (
	id INT, 
    loan_amnt DECIMAL, 
    int_rate DECIMAL, 
    grade VARCHAR(2), 
    emp_length DECIMAL, 
    home_ownership INT,
	annual_inc DECIMAL, 
    loan_status VARCHAR(45), 
    purpose VARCHAR(45), 
    addr_state VARCHAR(45), 
    fico_range_low INT,
	inq_last_6mths INT, 
    mths_since_last_record INT, 
    open_acc INT, 
    pub_rec INT,
	total_acc INT, 
    application_type VARCHAR(45), 
    acc_now_delinq INT, 
    open_acc_6m INT,
    open_act_il INT, 
    open_il_12m INT, 
    mths_since_rcnt_il INT, 
    open_rv_12m INT,
	inq_fi INT, 
    total_cu_tl INT, 
    inq_last_12m INT, 
    acc_open_past_24mths INT,
    mo_sin_old_il_acct INT, 
    mo_sin_old_rev_tl_op INT, 
    mo_sin_rcnt_rev_tl_op INT,
    mort_acc INT, 
    mths_since_recent_bc INT, 
    mths_since_recent_bc_dlq INT,
	mths_since_recent_inq INT, 
    num_accts_ever_120_pd INT, 
    num_actv_bc_tl INT,
	num_actv_rev_tl INT, 
    num_bc_sats INT, 
    num_bc_tl INT, 
    num_il_tl INT,
	num_op_rev_tl INT, 
    num_rev_accts INT, 
    num_tl_120dpd_2m INT, 
    num_tl_30dpd INT,
	num_tl_op_past_12m INT, 
    pct_tl_nvr_dlq DECIMAL, 
    percent_bc_gt_75 DECIMAL,
	pub_rec_bankruptcies INT
    );
    

 
 
	