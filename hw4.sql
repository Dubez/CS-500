-- this is for Q1

select T.relname as table_name, A.attname as attribute_name, A.attnum as ordinal_position, A.atttypid as attribute_type, A.attlen as attribute_length from pg_class T, pg_attribute A where T.oid=A.attrelid and relname = 'nba' order by A.attnum;

-- Q1 without the system columns

select T.relname as table_name, A.attname as attribute_name, A.attnum as ordinal_position, A.atttypid as attribute_type, A.attlen as attribute_length from pg_class T, pg_attribute A where T.oid=A.attrelid and relname = 'nba' and A.attnum>0  order by A.attnum;


-- this is for Q2

alter table nba add constraint pk_nba primary key (player, season, team);

-- this is for Q3

select tablename as table_name, indexname as index_name, indexdef as index_definition from pg_indexes where tablename = 'nba';

-- this is for Q4

select distinct t.relname as table_name, am.amname as access_method, i.relnatts as num_of_index_attributes, i.relname as index_key, ix.indisunique as is_index_unique, ix.indisprimary as is_index_primary, ix.indisclustered as is_index_clustered from pg_class t, pg_class i, pg_index ix, pg_attribute a, pg_am am where t.oid = ix.indrelid and i.oid = ix.indexrelid and i.relam = am.oid and a.attrelid = t.oid and a.attnum = ANY(ix.indkey) and t.relkind = 'r' and t.relname = 'nba';

-- this is for Q5

select i.relname as index_name, a.attname as column_name from pg_class t, pg_class i, pg_index ix, pg_attribute a where t.oid = ix.indrelid and i.oid = ix.indexrelid and a.attrelid = t.oid and a.attnum = ANY(ix.indkey) and t.relkind = 'r' and t.relname = 'nba';




