-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Tri_HTransactionsUpdatedHistory] 
   ON  [dbo].[HTransactions]
   AFTER update
AS 

INSERT INTO [dbo].[HTransactionsHistory]
           ([TreansactionID]
           ,[TransactionDate]
           ,[ReqAmount]
           ,[PaiedAmount]
           ,[RemAmount]
           ,[ReceivedBy]
           ,[InvoiceNo]
           ,[PaymentTypeID]
           ,[Del]
           ,[AdvanceTransID]
           ,[AdvanceTrans]
           ,[PatientID]
           ,[BranchID]
           ,[ChequeNo]
           ,[ChequeDate]
           ,[BankID]
           ,[UpdatedBy]
           ,[CDATE]
           ,[LastUpdated]
           ,[ActionDt]
           ,[Action])

		   SELECT [TreansactionID]
      ,[TransactionDate]
      ,[ReqAmount]
      ,[PaiedAmount]
      ,[RemAmount]
      ,[ReceivedBy]
      ,[InvoiceNo]
      ,[PaymentTypeID]
      ,[Del]
      ,[AdvanceTransID]
      ,[AdvanceTrans]
      ,[PatientID]
      ,[BranchID]
      ,[ChequeNo]
      ,[ChequeDate]
      ,[BankID]
      ,[UpdatedBy]
      ,[CDATE]
      ,[LastUpdated]
	  ,getDate()
	  ,'Updated'
  FROM [dbo].[HTransactions]

  WHERE [TreansactionID] = (Select top 1 [TreansactionID] From inserted);

GO


