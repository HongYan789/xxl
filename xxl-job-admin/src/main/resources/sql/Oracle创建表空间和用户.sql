=============================================================================

cmd中进入
sqlplus sys/oracle as sysdba


/*分为四步 */ 

/*第1步：创建临时表空间(注意：F:\app\Administrator\oradata\orcl\ibm\ 手动创建路径)  */ 

create temporary tablespace xxl_temp  

tempfile 'c:\app\Administrator\oradata\orcl\xxl\xxl_temp.dbf' 

size 50m  

autoextend on  

next 50m maxsize 20480m  

extent management local;  

 

/*第2步：创建数据表空间  */

create tablespace xxl_data

logging  

datafile 'c:\app\Administrator\oradata\orcl\xxl\xxl_data.dbf' 

size 50m  

autoextend on  

next 50m maxsize 20480m  

extent management local;  

 

/*第3步：创建用户并指定表空间 密码是ibm */

create user xxl identified by xxl default tablespace xxl_data temporary tablespace xxl_temp;  
create user xxl_job identified by xxl_job default tablespace xxl_data temporary tablespace xxl_temp;  
 

/*第4步：给用户授予权限  */

grant connect,resource,create view,dba to xxl; 
grant connect,resource,create view,dba to xxl_job; 


---说明：一不小心把xxl_data设置为"xxl_data"了，所以每次都需要加双引号

create temporary tablespace xxl_temp  tempfile 'c:\app\Administrator\oradata\orcl\xxl\xxl_temp.dbf' size 50m  autoextend on  next 50m maxsize 20480m  extent management local;  

create tablespace xxl_data logging datafile 'c:\app\Administrator\oradata\orcl\xxl\xxl_data.dbf' size 200M autoextend on next 100M maxsize unlimited extent management local segment space management auto;

=====================================================================
