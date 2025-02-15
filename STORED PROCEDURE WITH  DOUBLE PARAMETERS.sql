USE [Tech7_Dev]
GO

/****** Object:  StoredProcedure [dbo].[spPullingPayerTransitions]    Script Date: 2/15/2025 1:41:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Developer:		<Funmi>
-- Create date: <2025-12-02>
-- Description:	<parameter for the purpose of trackingg start date>
-- =============================================
CREATE or Alter PROCEDURE [dbo].[spPullingPayerTransitions]
(@Start_Date date, 
@plan_ownership varchar (50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; --leave it ON, so data won't lock

    -- Insert statements for procedure here
SELECT [PATIENT]
      ,[MEMBERID]
      ,[START_DATE]
	  ,YEAR(START_DATE) as startYear
      ,[END_DATE]
      ,[PAYER]
      ,[SECONDARY_PAYER]
      ,[PLAN_OWNERSHIP]
      ,[OWNER_NAME]
  FROM [Tech7_Dev].[dbo].[payer_transitions]
  WHERE LEFT(START_DATE,4) = @Start_Date
  AND plan_ownership = @plan_ownership
END
GO

exec spPullingPayerTransitions '2021', self

