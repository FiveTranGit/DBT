SELECT
    XMLGET(s.value, 'Transaction_ID'):"$" :: string AS "Transaction_ID",
    XMLGET(s.value, 'Customer_ID'):"$" :: int AS "Customer_ID",
    XMLGET(s.value, 'Transaction_Date'):"$" :: date AS "Transaction_Date",
    XMLGET(s.value, 'Transaction_Type'):"$" :: string AS "Transaction_Type",
    XMLGET(s.value, 'Transaction_Amount'):"$" :: float AS "Transaction_Amount",
    XMLGET(s.value, 'Transaction_Mode'):"$" :: string AS "Transaction_Mode"
FROM ELT.S3SRCTRG.TRANSACTIONDATA,
LATERAL FLATTEN(input => TO_ARRAY(ELT.S3SRCTRG.TRANSACTIONDATA._DATA:"$")) s;
