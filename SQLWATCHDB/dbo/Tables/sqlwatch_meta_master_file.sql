﻿CREATE TABLE [dbo].[sqlwatch_meta_master_file]
(
	[sqlwatch_database_id] smallint,
	[sqlwatch_master_file_id] smallint identity (-32768,1) not null,
	--[database_create_date] datetime,
	[file_id] int,
	[file_type] tinyint,
	[file_name] nvarchar(260),
	[file_physical_name] nvarchar(260),
	[sql_instance] nvarchar(25) not null default @@SERVERNAME,
	[is_deleted] bit default 0 not null,
	[logical_disk] varchar(260),
	constraint PK_sql_perf_mon_master_files primary key clustered (
		[sql_instance], [sqlwatch_database_id], [sqlwatch_master_file_id]
		),
	constraint FK_sql_perf_mon_master_files_db foreign key ([sql_instance],[sqlwatch_database_id]) 
		references [dbo].[sqlwatch_meta_database](
			[sql_instance],[sqlwatch_database_id]
		) on delete cascade,
)
