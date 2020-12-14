grant execute on dbms_crypto to pdb_Rattler_admin with grant option;
grant execute on dbms_hm to pdb_Rattler_admin with grant option;

create role RL_Rattler_user;
grant create session to RL_Rattler_user;
create user pdb_Rattler_user identified by 123456
DEFAULT TABLESPACE TS_Rattler QUOTA 2M on TS_Rattler;
grant RL_Rattler_user to pdb_Rattler_User with admin option;

grant select on Tickets to RL_Rattler_user;
grant select on Orders to RL_Rattler_user;
grant select on Trains to RL_Rattler_user;
grant select on Trips to RL_Rattler_user;

grant execute on RegistrationUser to RL_Rattler_user; 
grant execute on AuthorizationUser to RL_Rattler_user; 
grant execute on DeleteUser to RL_Rattler_user; 
grant execute on UpdateLogin to RL_Rattler_user; 
grant execute on AddTicket to RL_Rattler_user; 
grant execute on DeleteTicket to RL_Rattler_user; 
grant execute on UpdateName to RL_Rattler_user; 
grant execute on AddOrder to RL_Rattler_user; 
grant execute on CancelOrder to RL_Rattler_user;

