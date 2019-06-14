USE [stackoverflow]
GO

-- CREANDO LA TABLA CON LOS CAMPOS DE TODAS LAS COLUMNAS
DROP TABLE IF EXISTS clean2017

SELECT [Respondent]
      ,[Professional] ocupacion
      ,[ProgramHobby] 
      ,[Country] pais
      ,[University] universidad
      ,[EmploymentStatus] estado_empleo
      ,[FormalEducation] educacion
      ,[MajorUndergrad] 
      ,[HomeRemote]
      ,[CompanySize] tamaño_empresa
      ,[CompanyType]
      ,[YearsProgram] experiencia
      ,[YearsCodedJob]
      ,[YearsCodedJobPast]
      ,[DeveloperType]
      ,[WebDeveloperType]
      ,[MobileDeveloperType]
      ,[NonDeveloperType]
      ,[CareerSatisfaction]
      ,[JobSatisfaction]
      ,[ExCoderReturn]
      ,[ExCoderNotForMe]
      ,[ExCoderBalance]
      ,[ExCoder10Years]
      ,[ExCoderBelonged]
      ,[ExCoderSkills]
      ,[ExCoderWillNotCode]
      ,[ExCoderActive]
      ,[PronounceGIF]
      ,[ProblemSolving]
      ,[BuildingThings]
      ,[LearningNewTech]
      ,[BoringDetails]
      ,[JobSecurity]
      ,[DiversityImportant]
      ,[AnnoyingUI]
      ,[FriendsDevelopers]
      ,[RightWrongWay]
      ,[UnderstandComputers]
      ,[SeriousWork]
      ,[InvestTimeTools]
      ,[WorkPayCare]
      ,[KinshipDevelopers]
      ,[ChallengeMyself]
      ,[CompetePeers]
      ,[ChangeWorld]
      ,[JobSeekingStatus]
      ,[HoursPerWeek]
      ,[LastNewJob]
      ,[AssessJobIndustry]
      ,[AssessJobRole]
      ,[AssessJobExp]
      ,[AssessJobDept]
      ,[AssessJobTech]
      ,[AssessJobProjects]
      ,[AssessJobCompensation]
      ,[AssessJobOffice]
      ,[AssessJobCommute]
      ,[AssessJobRemote]
      ,[AssessJobLeaders]
      ,[AssessJobProfDevel]
      ,[AssessJobDiversity]
      ,[AssessJobProduct]
      ,[AssessJobFinances]
      ,[ImportantBenefits]
      ,[ClickyKeys]
      ,[JobProfile]
      ,[ResumePrompted]
      ,[LearnedHiring]
      ,[ImportantHiringAlgorithms]
      ,[ImportantHiringTechExp]
      ,[ImportantHiringCommunication]
      ,[ImportantHiringOpenSource]
      ,[ImportantHiringPMExp]
      ,[ImportantHiringCompanies]
      ,[ImportantHiringTitles]
      ,[ImportantHiringEducation]
      ,[ImportantHiringRep]
      ,[ImportantHiringGettingThingsDone]
      ,[Currency]
      ,[Overpaid]
      ,[TabsSpaces]
      ,[EducationImportant]
      ,[EducationTypes]
      ,[SelfTaughtTypes]
      ,[TimeAfterBootcamp]
      ,[CousinEducation]
      ,[WorkStart]
      ,[HaveWorkedLanguage]
      ,[WantWorkLanguage]
      ,[HaveWorkedFramework]
      ,[WantWorkFramework]
      ,[HaveWorkedDatabase]
      ,[WantWorkDatabase]
      ,[HaveWorkedPlatform]
      ,[WantWorkPlatform]
      ,[IDE]
      ,[AuditoryEnvironment]
      ,[Methodology]
      ,[VersionControl]
      ,[CheckInCode]
      ,[ShipIt]
      ,[OtherPeoplesCode]
      ,[ProjectManagement]
      ,[EnjoyDebugging]
      ,[InTheZone]
      ,[DifficultCommunication]
      ,[CollaborateRemote]
      ,[MetricAssess]
      ,[EquipmentSatisfiedMonitors]
      ,[EquipmentSatisfiedCPU]
      ,[EquipmentSatisfiedRAM]
      ,[EquipmentSatisfiedStorage]
      ,[EquipmentSatisfiedRW]
      ,[InfluenceInternet]
      ,[InfluenceWorkstation]
      ,[InfluenceHardware]
      ,[InfluenceServers]
      ,[InfluenceTechStack]
      ,[InfluenceDeptTech]
      ,[InfluenceVizTools]
      ,[InfluenceDatabase]
      ,[InfluenceCloud]
      ,[InfluenceConsultants]
      ,[InfluenceRecruitment]
      ,[InfluenceCommunication]
      ,[StackOverflowDescribes]
      ,[StackOverflowSatisfaction]
      ,[StackOverflowDevices]
      ,[StackOverflowFoundAnswer]
      ,[StackOverflowCopiedCode]
      ,[StackOverflowJobListing]
      ,[StackOverflowCompanyPage]
      ,[StackOverflowJobSearch]
      ,[StackOverflowNewQuestion]
      ,[StackOverflowAnswer]
      ,[StackOverflowMetaChat]
      ,[StackOverflowAdsRelevant]
      ,[StackOverflowAdsDistracting]
      ,[StackOverflowModeration]
      ,[StackOverflowCommunity]
      ,[StackOverflowHelpful]
      ,[StackOverflowBetter]
      ,[StackOverflowWhatDo]
      ,[StackOverflowMakeMoney]
      ,[Gender]
      ,[HighestEducationParents]
      ,[Race]
      ,[SurveyLong]
      ,[QuestionsInteresting]
      ,[QuestionsConfusing]
      ,[InterestedAnswers]
      ,[Salary] ingresos
      ,[ExpectedSalary] ingresos_esperados
	  ,2017 año INTO clean2017
  FROM [dbo].[s2017]

 DROP TABLE IF EXISTS m2017
 SELECT ocupacion
      ,pais
      ,tamaño_empresa
      ,[CompanyType]
      , experiencia
      ,[HaveWorkedLanguage]
      , ingresos
	  ,año INTO m2017
  FROM clean2017

  -- ELIMINANDO LOS DOS PRIMEROS REGISTROS

  -- MODIFICANDO EL CAMPO EXPERIENCIA

  UPDATE m2017 SET experiencia = REPLACE (experiencia, 'Less than 1 year', '2-5')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '1 to 2 years', '2-5')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '2 to 3 years', '2-5')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '3 to 4 years', '2-5')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '4 to 5 years', '2-5')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '5 to 6 years', '2-5')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '6 to 7 years', '6-10')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '7 to 8 years', '6-10')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '8 to 9 years', '6-10')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '9 to 10 years', '6-10')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '10 to 11 years', '6-10')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '11 to 12 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '12 to 13 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '13 to 14 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '14 to 15 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '15 to 16 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '16 to 17 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '17 to 18 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '18 to 19 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '19 to 20 years', '11')
  UPDATE m2017 SET experiencia = REPLACE (experiencia, '20 or more years', '11')

  SELECT * FROM m2017

 -- MODIFICAR CAMPO LENGUAJE

--Agregar columnas para cada lenguaje
ALTER TABLE m2017 ADD [lenguaje_python] [int] NULL
ALTER TABLE m2017 ADD [lenguaje_java] [int] NULL
ALTER TABLE m2017 ADD [lenguaje_c#] [int] NULL
ALTER TABLE m2017 ADD [lenguaje_javascript] [int] NULL
ALTER TABLE m2017 ADD [lenguaje_sql] [int] NULL
ALTER TABLE m2017 ADD [lenguaje_php] [int] NULL
ALTER TABLE m2017 ADD [lenguaje_ruby] [int] NULL

--Cursor para desagregar lenguajes
DECLARE @order INT
DECLARE @lenguaje VARCHAR(50)

DECLARE cursor_lenguajes CURSOR FOR 
	SELECT 1, 'JavaScript'
	UNION
	SELECT 2, 'Python'
	UNION
	SELECT 3, 'C#'
	UNION
	SELECT 4, 'PHP'
	UNION
	SELECT 5, 'SQL'
	UNION
	SELECT 6, 'JAVA'
	UNION
	SELECT 7, 'Ruby'
	UNION
	SELECT 8, 'C++'
	ORDER BY 1

OPEN cursor_lenguajes 

FETCH NEXT FROM cursor_lenguajes INTO @order, @lenguaje

WHILE @@FETCH_STATUS = 0
BEGIN

	EXECUTE('
		UPDATE clean2017 
		SET lenguaje_' + @lenguaje + ' = CASE WHEN HaveWorkedLanguage LIKE ''%' + @lenguaje + '%'' THEN 1 ELSE 0 END, 
		   HaveWorkedLanguage = REPLACE(HaveWorkedLanguage,''' + @lenguaje + ''','''')
	')

	FETCH NEXT FROM cursor_lenguajes INTO @order, @lenguaje
END 

CLOSE cursor_lenguajes
DEALLOCATE cursor_lenguajes