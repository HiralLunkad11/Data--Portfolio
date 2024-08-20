SELECT * FROM bank_loan_data.`financial_loan (1)`;
/* Total Loan Applications */
SELECT COUNT(id) AS Total_Applications FROM bank_loan_data.`financial_loan (1)`;

 /*Total Funded Amount */
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data.`financial_loan (1)`;

  /*Total Amount Received */
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data.`financial_loan (1)`;

/* Average Interest Rate */
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data.`financial_loan (1)`;

/* Avg DTI */
SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan_data.`financial_loan (1)`;

/* GOOD LOAN ISSUED 
Good Loan Percentage */
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data.`financial_loan (1)`;

/*Good Loan Applications */
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data.`financial_loan (1)`
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

/*Good Loan Funded Amount */
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data.`financial_loan (1)`
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

/*Good Loan Amount Received */
SELECT 
    SUM(total_payment) AS Good_Loan_amount_received
FROM
    bank_loan_data.`financial_loan (1)`
WHERE
    loan_status = 'Fully Paid'
        OR loan_status = 'Current';
 /*------------------------------------------------------------------ */      
        /*BAD LOAN ISSUED
        Bad Loan Percentage*/
        SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data.`financial_loan (1)`;

/*Bad Loan Applications*/
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data.`financial_loan (1)`
WHERE loan_status = 'Charged Off';

/*Bad Loan Funded Amount*/
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data.`financial_loan (1)`
WHERE loan_status = 'Charged Off';

/*Bad Loan Amount Received*/
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data.`financial_loan (1)`
WHERE loan_status = 'Charged Off';
/*------------------------------------------------------------------ */      

/*LOAN STATUS */
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data.`financial_loan (1)`
    GROUP BY
        loan_status;
        /*-------------------------------------------------------*/
       /* BANK LOAN REPORT 
        By State */
        SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data.`financial_loan (1)`
GROUP BY address_state
ORDER BY address_state;

/* By TERM */
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data.`financial_loan (1)`
GROUP BY term
ORDER BY term;

/*By EMPLOYEE LENGTH */
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data.`financial_loan (1)`
GROUP BY emp_length
ORDER BY emp_length;

/*By PURPOSE*/
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data.`financial_loan (1)`
GROUP BY purpose
ORDER BY purpose;

/* HOME OWNERSHIP */
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data.`financial_loan (1)`
GROUP BY home_ownership
ORDER BY home_ownership;





















